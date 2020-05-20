package com.company;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        System.out.println(getGreatestCommonDivisor(81,153));
    }

    public static int getGreatestCommonDivisor(int first, int second) {
        if(first<10 || second<10) {return -1;}

        List<Integer> listA = new ArrayList<Integer>();
        int common = 1;

        for(int i=1; i<=first/2; i++) {
            if(first%i == 0){
                listA.add(i);
            }
        }

        for(int j=listA.size()-1; j>=0; j--){
            if (second%listA.get(j) == 0) {
                common = listA.get(j);
                break;
            }
        }
        return common;
    }
}
