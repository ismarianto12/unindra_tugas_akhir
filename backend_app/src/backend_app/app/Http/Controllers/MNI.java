import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class MNI {

    public String encrypt(String plainText) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
            SecretKeySpec key = new SecretKeySpec(KEY.getBytes("UTF-8"), "AES");
            cipher.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(IV.getBytes("UTF-8")));
            return bytesToHex(cipher.doFinal(pad(plainText, 16).getBytes("UTF-8")));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String decrypt(String cipherText) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
            SecretKeySpec key = new SecretKeySpec(KEY.getBytes("UTF-8"), "AES");
            cipher.init(Cipher.DECRYPT_MODE, key,new IvParameterSpec(IV.getBytes("UTF-8")));
            byte[] buf = hexToBytes(cipherText);
            return new String(cipher.doFinal(buf),"UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private String pad(String text, int m) {
        StringBuffer sb = new StringBuffer(text);
        int span = m - (text.length() % m);
        for (int i=0; i<span; i++) sb.append("\0");
        return sb.toString();
    }

    private byte[] hexToBytes(String text) {
        byte[] buf = new byte[text.length() / 2];
        for (int i=0; i<text.length()/2; i++) {
            String txt = text.substring(i*2, i*2+2);
            short s = Short.valueOf(txt, 16);
            buf[i] = (byte) s;
        }
        return buf;
    }

    private String bytesToHex(byte[] buf) {
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<buf.length; i++) {
            sb.append(String.format("%02X", buf[i]));
        }
        return sb.toString();
    }

    private static final String IV       = "1F4114E9F8B1B968";
    private static final String KEY      = "97DF7EF6E7D71FA3";

    public static void main(String [] args) {
        MNI mni = new MNI();
        try {
            if (args.length < 2) return;
            if (args[0].equals("-d")) {
            	System.out.println(mni.decrypt(args[1].trim()));
            } else if (args[0].equals("-e")) {
            	System.out.println(mni.encrypt(args[1].trim()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}