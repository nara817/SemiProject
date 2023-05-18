package com.gdu.moovod.aspect;

import com.gdu.moovod.util.SecurityUtil;

public class MainClass {

  public static void main(String[] args) {
    
    SecurityUtil securityUtil = new SecurityUtil();
    
    System.out.println(securityUtil.getSha256("1111"));
    System.out.println(securityUtil.getSha256("2222"));
    System.out.println(securityUtil.getSha256("3333"));

  }

}