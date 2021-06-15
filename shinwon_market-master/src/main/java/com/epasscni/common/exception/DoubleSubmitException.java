package com.epasscni.common.exception;

public class DoubleSubmitException extends Exception {

	static final long serialVersionUID = 2471807980420901707L;

	public DoubleSubmitException(String msg){
		super(msg);
	}
}