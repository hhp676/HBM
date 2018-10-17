package com.hginfo.hdf.generator.core;

/**
 * 代码生成时遇到的异常。
 * Created by qiujingde on 2016/12/6.
 *
 */
public class GeneratorException extends RuntimeException {

    /**
     * 封装底层异常。
     * @param cause 实际异常原因
     */
    public GeneratorException(Exception cause) {
        super(cause);
    }

}
