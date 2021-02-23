package com.sx.utils;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FileUtil {

    // current dir: /Users/chan_zz/Documents/Code/java
    private static String SAVE_PATH = "";

    public static void createDir() {

        String str[] = System.getProperty("user.dir")
                .replaceAll("\\\\", "/").split("/");

        for (int i = 0; i < str.length - 1; ++i) {

            SAVE_PATH += str[i];

            if (i != str.length - 2) {

                SAVE_PATH += File.separator;

            }
        }

        //创建图片文件夹
        File file = new File(SAVE_PATH + File.separator + "photo");

        if (!file.exists())
            file.mkdir();

    }

    public static String saveFile(String fileName, InputStream inputStream) {

        String path = SAVE_PATH + File.separator + fileName;

        File file = new File(path);

        try (FileOutputStream outputStream = new FileOutputStream(file)) {

            outputStream.write(readInputStream(inputStream));

            outputStream.flush();

            outputStream.close();

            return path;

        } catch (Exception e) {

            e.printStackTrace();

            return null;

        }
    }

    private static byte[] readInputStream(InputStream inStream) throws Exception {

        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[1024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len;
        //使用一个输入流从buffer里把数据读取出来
        while ((len = inStream.read(buffer)) != -1) {
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }

    public static String getPhoto() {

        return "/photo/4ffee74a-bde6-4a0b-a90d-0f1a7c2e9ebb.jpg";
    }

    public static String getIntroduce() {

        return "/photo/655b187c-e224-4d83-a535-06f2bb0e3d0a.png";
    }

}
