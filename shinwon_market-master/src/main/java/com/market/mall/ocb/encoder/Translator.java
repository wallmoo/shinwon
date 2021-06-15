/**
 * @(#) Translator.java
 * Copyright 2004-2008 by  Famz Inc.
 *
 * 
 *
 * @BoCShop
 * @author  JANGHASO, janghaso@famz.co.kr
 * @MAKE 2008. 10. 10
 * @EDIT 
 */
package com.market.mall.ocb.encoder;

/**
 * general interface for an translator.
 */
public interface Translator
{
    /**
     * size of the output block on encoding produced by getDecodedBlockSize()
     * bytes.
     */
    public int getEncodedBlockSize();

    public int encode(byte[] in, int inOff, int length, byte[] out, int outOff);

    /**
     * size of the output block on decoding produced by getEncodedBlockSize()
     * bytes.
     */
    public int getDecodedBlockSize();

    public int decode(byte[] in, int inOff, int length, byte[] out, int outOff);
}
