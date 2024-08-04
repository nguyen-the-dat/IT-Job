/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author ngoba
 */
public class CommonUtils {

    public static String getStringParameter(HttpServletRequest request, String parameterName) {
        try {
            return (String) request.getParameter(parameterName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int getIntParameter(HttpServletRequest request, String parameterName) {
        try {
            String parameterValue = (String) request.getParameter(parameterName);
            if (parameterValue != null) {
                return Integer.parseInt(parameterValue);
            }
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static Timestamp getTimestampParameter(HttpServletRequest request, String parameterName) {
        try {
            String parameterValue = (String) request.getParameter(parameterName);
            if (parameterValue != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date parsedDate = dateFormat.parse(parameterValue);

                if (parsedDate != null) {
                    return new Timestamp(parsedDate.getTime());
                }
            }
        } catch (ParseException | NullPointerException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static float getFloatParameter(HttpServletRequest request, String parameterName) {
        try {
            String parameterValue = (String) request.getParameter(parameterName);
            if (parameterValue != null) {
                return Float.parseFloat(parameterValue);
            }
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        return 0.0f;
    }

    public static int[] getIntCheckboxParameterValues(HttpServletRequest request, String parameterName) {
        try {
            String[] parameterValues =(String[]) request.getParameterValues(parameterName);
            if (parameterValues.length > 0) {
                int[] values = new int[parameterValues.length];
                for (int i = 0; i < parameterValues.length; i++) {
                    values[i] = Integer.parseInt(parameterValues[i]);
                }
                return values;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new int[0];
    }

}
