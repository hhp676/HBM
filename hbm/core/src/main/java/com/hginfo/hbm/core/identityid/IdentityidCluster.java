/**
 * Project Name:hbm-Identityid
 * File Name:IdentityidCluster.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午10:42:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.identityid;

import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.util.Enumeration;
import java.util.concurrent.atomic.AtomicInteger;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.Constants;
import com.hginfo.hutils.StringUtil;

/**
 * 多机或集群环境下唯一ID生成实现类。
 * 生成方法：毫秒时间戳(43位，最大时间到2248年)+(20位=10位机器码+10位循环自增数)
 * 机器码计算方法：mac或网络地址和进程号连接后的哈希。
 * 其它网络场景：10位机器码理论最大支持1024台机器，优先取网络地址最后10位，获取不到则取mac最后10位，否则取随机数0-1023
 * ClassName:IdentityidCluster <br/>
 * Date: 2016年10月14日 上午10:42:59 <br/>
 * @author licheng
 */
public class IdentityidCluster implements Identityid {
    
    /**
     * 
     */
    private static AtomicInteger atomicInc            = new AtomicInteger(
        (new java.util.Random()).nextInt());
    
    /**
     * 
     */
    private static SecureRandom  secureRandom         = new SecureRandom();
    
    /**
     * 保留最后10位：与操作 00000000 00000000 00000011 11111111。
     */
    private static final int     INCNUMBER_AND_NUMBER = 1023;
    
    /**
     * 基础时间.
     */
    private static final Long    BENCHMARK_TIME       = 476862781000L;
    
    /**
     * 
     */
    private static Integer       machineId            = null;
    
    /**
     * 
     */
    private static Log           logger               = LogFactory.getLog(IdentityidCluster.class);
    
    static {
        machineId = getMachineId();
    }
    
    @Override
    public long getIdentityid() {
        long currentTime = System.currentTimeMillis();
        int incNumber = atomicInc.getAndIncrement();
        long identityid = (currentTime - BENCHMARK_TIME) << Constants.TWENTY
            | (machineId << Constants.TEN) | (incNumber & INCNUMBER_AND_NUMBER);
        return identityid;
        
    }
    
    /**
     * 获取10位机器码。
     * @author licheng
     * @return 机器码
     * @since V1.0.0
     */
    private static int getMachineId() {
        try {
            String networkId = "";
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface
                .getNetworkInterfaces();
            //获取网络mac
            while (networkInterfaces.hasMoreElements()) {
                NetworkInterface networkInterface = networkInterfaces.nextElement();
                logger.debug("networkInterface:" + networkInterface.toString());
                for (Enumeration<InetAddress> enumIpAddress = networkInterface
                    .getInetAddresses(); enumIpAddress.hasMoreElements();) {
                    InetAddress inetAddress = enumIpAddress.nextElement();
                    if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress()
                        && inetAddress.isSiteLocalAddress()) {
                        logger.debug(inetAddress.getHostAddress().toString() + "\n");
                        if (networkInterface.getHardwareAddress().length > Constants.THREE) {
                            networkId = networkInterface.getHardwareAddress().toString();
                            break;
                        } else if (inetAddress.getAddress().length > Constants.THREE) {
                            networkId = inetAddress.getAddress().toString();
                            break;
                        }
                    }
                    
                }
            }
            //获取进程号
            String processName = ManagementFactory.getRuntimeMXBean().getName();
            if (!StringUtil.isEmpty(processName)) {
                processName = processName.split("@")[0];
            }
            return ((networkId + processName).hashCode() & Constants.NUMBER_0XFFFF)
                % (Constants.NUMBER_1024);
        } catch (Throwable e) {
        }
        return secureRandom.nextInt(Constants.NUMBER_1024);
    }
    
    /**
     * .
     * @author licheng
     * @param args 
     * @throws UnknownHostException 
     * @throws SocketException 
     * @since V1.0.0
     */
    public static void main(String[] args) throws UnknownHostException, SocketException {
        
        getMachineId();
        //System.out.print(0x3f);
    }
    
}
