package com.genesis.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;

public class Util {
	public SessionFactory getSF() {
		Configuration config=new Configuration().configure();
		return config.buildSessionFactory();
		
	}
	public static void main(String args[]) {
		System.out.println(new Util().getSF());
	}
}
