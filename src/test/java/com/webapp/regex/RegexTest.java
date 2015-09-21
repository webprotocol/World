package com.webapp.regex;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTest {

	/*
	 * 문자열 검색, 대체, 추출 ==> 정규표현식(Reqular Expression)
	 * 
	 * . ==> new line 문자를 제외한 모든문자
	 * ^ ==> Line Start
	 * $ ==> Line End
	 * * ==> 앞문자가 0개 이상 반복
	 * + ==> 앞문자가 1개 이상 반복
	 * [AYZ] ==> one char 부분집합
	 * {n}   ==> 앞문자가 n개 반복
	 * {n,}  ==> 앞문자가 n개 이상 반복
	 * {n,m} ==> 앞문자가 n <= 갯수 <=m
	 */
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
//		String regex = "^.$";
//		String regex = "^A*$";
//		String regex = "^A+$";
//		String regex = "^[A-Z0-9]{3}$";
//		String regex = "^[A-Z0-9]{3,5}$";
//		String regex = "^[가-힣]{3,5}$";
		String regex = "[A-Za-z]{3}";
		
		//  02-333-4444
		// 011-333-4444
		// 010-3333-4444
		  
		while(true) {
			String line = scan.nextLine();
			System.out.println("line = [" + line + "]");
			Pattern pattern = Pattern.compile(regex);
			Matcher m = pattern.matcher(line);
			System.out.println("match = " + m.find());
			
//			System.out.println("match = " + Pattern.matches(regex, line));
		}
		
		
	}

}
