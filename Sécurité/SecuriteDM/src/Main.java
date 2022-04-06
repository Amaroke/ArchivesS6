import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;


public class Main {

    private static final int valMax = (int) Math.pow(2, 31);
    private static final int sVN = 1111;
    private static final int sSTM = 5000;
    private static final int sRANDU = 5000;


    public static int vonNeuman(int seed) {
        int r = seed * seed;
        if (!(r > 0 && r < 9999)) {
            String s = String.valueOf(r);
            while (s.length() >= 5) {
                s = s.substring(1, s.length() - 1);
            }
            r = Integer.parseInt(s);
        }
        return r;
    }

    public static int STM(int seed) {
        long a = 16807;
        long res = a * (long) seed;
        return (int) (((res % (valMax - 1))));
    }

    public static int RANDU(int seed) {
        long a = 65539;
        long res = a * (long) seed;
        return (int) (res % valMax);
    }

    public static ArrayList<Integer> nVonNeuman(int seed) {
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            seed = vonNeuman(seed);
            res.add(seed);
        }
        return res;
    }

    public static ArrayList<Integer> nSTM(int seed) {
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            seed = STM(seed);
            res.add(seed);
        }
        return res;
    }

    public static ArrayList<Integer> nRANDU(int seed) {
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            seed = RANDU(seed);
            res.add(seed);
        }
        return res;
    }

    public static ArrayList<Integer> nRANDOM() {
        int l;
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            l = (int) (Math.random() * valMax);
            res.add(l);
        }
        return res;
    }

    public static void testVisuelVonNeuman() {
        ArrayList<Integer> vecteur = nVonNeuman(sVN);
        for (Integer l : vecteur) {
            ecrireTest(l);
        }
    }

    public static void testVisuelSTM() {
        ArrayList<Integer> vecteur = nSTM(sVN);
        for (Integer l : vecteur) {
            ecrireTest(l);
        }
    }

    public static void testVisuelRANDU() {
        ArrayList<Integer> vecteur = nRANDU(sVN);
        for (Integer l : vecteur) {
            ecrireTest(l);
        }
    }

    public static void testVisuelRANDOM() {
        ArrayList<Integer> vecteur = nRANDOM();
        for (Integer l : vecteur) {
            ecrireTest(l);
        }
    }

    public static void ecrireTest(int res) {
        System.out.println(res);
        try {
            FileWriter fw = new FileWriter("test.txt", true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(res + "\n");
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void testVisuel() {
        testVisuelVonNeuman();
        testVisuelSTM();
        testVisuelRANDU();
        testVisuelRANDOM();
    }


    public static float frequency(ArrayList<Integer> x, int nb) {
        int res = 0;
        int cpt = 0;
        StringBuilder s = new StringBuilder();
        for (Integer j : x) {
            s.append(Integer.toBinaryString(j));
            cpt += s.length();
        }
        //System.out.println(s);
        //System.out.println(cpt);
        for (int i = 0; i < s.length(); i++) {
            res += (s.charAt(i) == '0') ? -1 : 1;
        }
        //System.out.println(res);
        //System.out.println("*******");

        float sObs = (float) (Math.abs(res) / Math.sqrt(cpt));
        //System.out.println(sObs);
        //System.out.println((float) (2 * (1 - CNDF(sObs))));
        return (float) (2 * (1 - CNDF(sObs)));
    }



    public static double CNDF(double x) {
        int neg = (x < 0d) ? 1 : 0;
        if (neg == 1)
            x *= -1d;

        double k = (1d / (1d + 0.2316419 * x));
        double y = ((((1.330274429 * k - 1.821255978) * k + 1.781477937) *
                k - 0.356563782) * k + 0.319381530) * k;
        y = 1.0 - 0.398942280401 * Math.exp(-0.5 * x * x) * y;

        return (1d - neg) * y + neg * (1d - y);
    }

    public static float nFrequencyVonNeuman(int n) {
        float sum = 0;
        for (int i = 0; i < n; i++) {
            sum += frequency(nVonNeuman(50 + 50 * i), 32);
        }
        return sum / 100;
    }

    public static float nFrequencySTM(int n) {
        float sum = 0;
        for (int i = 0; i < n; i++) {
            sum += frequency(nSTM(50 + 50 * i), 32);
        }
        return sum / 100;
    }

    public static float nFrequencyRANDU(int n) {
        float sum = 0;
        for (int i = 0; i < n; i++) {
            sum += frequency(nRANDU(50 + 50 * i), 32);
        }
        return sum / 100;
    }

    public static float nFrequencyRANDOM(int n) {
        float sum = 0;
        for (int i = 0; i < n; i++) {
            sum += frequency(nRANDOM(), 32);
        }
        return sum / 100;
    }

    public static void main(String[] args) {
        ArrayList<Integer> test = new ArrayList<>();
        for(int i = 0; i<32; i++) {
            test.add(1);
        }
        System.out.println(frequency(test, 32));
        /*
        System.out.println(nFrequencyVonNeuman(100));
        System.out.println(nFrequencySTM(100));
        System.out.println(nFrequencyRANDU(100));
        System.out.println(nFrequencyRANDOM(100));

         */
    }
}