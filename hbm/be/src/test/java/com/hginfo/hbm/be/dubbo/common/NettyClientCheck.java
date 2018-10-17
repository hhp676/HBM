package com.hginfo.hbm.be.dubbo.common;

import org.jboss.netty.bootstrap.ClientBootstrap;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelDownstreamHandler;
import org.jboss.netty.channel.ChannelEvent;
import org.jboss.netty.channel.ChannelFactory;
import org.jboss.netty.channel.ChannelFuture;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelUpstreamHandler;
import org.jboss.netty.channel.Channels;
import org.jboss.netty.channel.socket.nio.NioClientSocketChannelFactory;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.InetSocketAddress;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;


/**
 * Created by qiujingde on 2017/4/6.
 * @author qiujingde
 */
public class NettyClientCheck {

    private static final Logger log = LoggerFactory.getLogger(NettyClientCheck.class);

    // using static channelFactory to avoid memory leak.
    // see https://issues.jboss.org/browse/NETTY-424
    private static final ChannelFactory channelFactory = new NioClientSocketChannelFactory(
            Executors.newCachedThreadPool(),
            Executors.newCachedThreadPool(),
            Runtime.getRuntime().availableProcessors() + 1);

    @Test
    public void testConnect() throws Exception {
        String host = "192.168.2.185";
        int port = 20880;

        ClientBootstrap bootstrap = new ClientBootstrap(channelFactory);

        bootstrap.setOption("keepAlive", true);
        bootstrap.setOption("tcpNoDelay", true);
        bootstrap.setOption("connectTimeoutMillis", 1000);

        bootstrap.setPipelineFactory(() -> {
            ChannelPipeline pipeline = Channels.pipeline();
            pipeline.addLast("handler", new ChannelHandler());
            return pipeline;
        });

        ChannelFuture future = bootstrap.connect(new InetSocketAddress(host, port));

        future.awaitUninterruptibly(1000, TimeUnit.MILLISECONDS);
        Channel channel = future.getChannel();
        if (channel.isConnected()) {
            log.info("Succeeded to connect");
        } else if (future.getCause() != null) {
            log.error("Failed to connect: ", future.getCause());
        } else {
            log.info("Failed to connect");
        }
    }

    private static class ChannelHandler implements ChannelUpstreamHandler, ChannelDownstreamHandler {
        @Override
        public void handleUpstream(ChannelHandlerContext ctx, ChannelEvent e) throws Exception {
            ctx.sendUpstream(e);
        }

        @Override
        public void handleDownstream(ChannelHandlerContext ctx, ChannelEvent e) throws Exception {
            ctx.sendDownstream(e);
        }
    }

}


