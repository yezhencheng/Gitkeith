package com.Utils;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Timer {
	 public static void main(String[] args) {  
	        Runnable runnable = new Runnable() {  
	            public void run() {  
	                // task to run goes here  
	                System.out.println("task to run goes here");
	            }  
	        };  
	        ScheduledExecutorService service = Executors  
	                .newSingleThreadScheduledExecutor();  
	        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
	        service.scheduleAtFixedRate(runnable, 5, 1, TimeUnit.SECONDS);  
	    }  
}
