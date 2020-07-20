package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    public static int daysBetween(String pre, String after)
    {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            Date smdate = sdf.parse("pre");

            Date bdate = sdf.parse("after");

            Calendar cal = Calendar.getInstance();

            cal.setTime(smdate);

            long time1 = cal.getTimeInMillis();

            cal.setTime(bdate);

            long time2 = cal.getTimeInMillis();

            long between_days = (time2 - time1) / (1000 * 3600 * 24);

            return Integer.parseInt(String.valueOf(between_days));
        }catch (Exception e){
            return Integer.MAX_VALUE;
        }
    }
}
