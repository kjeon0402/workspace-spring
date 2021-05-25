package com.itbank.hash;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class Hash {
	// 입력값을 알아볼 수 없는 형태로 변경하지만, 입력값이 같으면 출력값도 항상 일정하다
	// 원래의 값을 식별할 수는 없으나, 일치 여부는 판단 가능하다
	static String getHash(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.reset();
		md.update(input.getBytes("utf-8"));
		return String.format("%0128x", new BigInteger(1, md.digest()));
	}
	
	public static void main(String[] args) throws Exception {
		String text1 = "itbank";
		System.out.println("text1 : " + text1);
		System.out.println("getHash(text1) : " + getHash(text1));
		
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력 : ");
		String text2 = sc.nextLine();
		
		System.out.println("두 문자열이 일치하는가 : " + text1.equals(text2));
		String hash1 = getHash(text1);
		String hash2 = getHash(text2);
		System.out.println("두 해쉬값이 일치하는가 : " + hash1.equals(hash2));
		// 해쉬값이 서로 일치하면, 원본값도 같은 값이다
		System.out.println(hash2);
		System.out.println(hash2.length());
	}
}
