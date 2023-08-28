package interfaces;


import net.sf.clipsrules.jni.Environment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class CountriesFlagColors extends javax.swing.JFrame implements ActionListener {
    private Container c;
    private JLabel title;
    private JLabel name;
    private JTextField tname;

    private JLabel name2;
    private JTextField tname2;

    private JLabel name3;
    private JTextField tname3;
    private JButton sub;
    private JButton reset;

    private JButton AddColor;
    private JButton Assert;
    private JTextArea tout;
    private JLabel res;
    private JTextArea resadd;
    static String colors="";
    static String colorsForPrinting="";
    ArrayList<String> arr=new ArrayList<>();
    Environment clips= new Environment();
    static int check=0;
    public CountriesFlagColors() {
        clips.load("p2.clp");
        clips.reset();
        setTitle("Clips Expert System");
        setBounds(300, 90, 500, 620);
        setResizable(false);

        c = getContentPane();
        c.setLayout(null);

        title = new JLabel("Countries Flag Color Expert System");
        title.setFont(new Font("Arial", Font.BOLD, 25));
        title.setSize(600, 30);
        title.setLocation(30, 30);
        c.add(title);

        name = new JLabel("Enter Color");
        name.setFont(new Font("Arial", Font.PLAIN, 25));
        name.setSize(150, 20);
        name.setLocation(180, 100);
        c.add(name);

        tname = new JTextField();
        tname.setFont(new Font("Arial", Font.PLAIN, 25));
        tname.setSize(200, 35);
        tname.setLocation(140, 130);
        c.add(tname);

        name2 = new JLabel("Add Country");
        name2.setFont(new Font("Arial", Font.PLAIN, 25));
        name2.setSize(150, 30);
        name2.setLocation(175, 270);
        c.add(name2);

        tname2 = new JTextField();
        tname2.setFont(new Font("Arial", Font.PLAIN, 25));
        tname2.setSize(200, 35);
        tname2.setLocation(140, 305);
        c.add(tname2);


        name3 = new JLabel("Enter Colors Names");
        name3.setFont(new Font("Arial", Font.PLAIN, 20));
        name3.setSize(200, 20);
        name3.setLocation(60, 400);
        c.add(name3);

        tname3 = new JTextField();
        tname3.setFont(new Font("Arial", Font.PLAIN, 25));
        tname3.setSize(200, 35);
        tname3.setLocation(50, 430);
        c.add(tname3);

        AddColor = new JButton("Insert");
        AddColor.setFont(new Font("Arial", Font.PLAIN, 15));
        AddColor.setSize(100, 32);
        AddColor.setLocation(95, 473);
        AddColor.addActionListener(this);
        c.add(AddColor);

        Assert = new JButton("Assert Country");
        Assert.setFont(new Font("Arial", Font.BOLD, 15));
        Assert.setSize(150, 32);
        Assert.setLocation(70, 520);
        Assert.addActionListener(this);
        c.add(Assert);


        sub = new JButton("Run");
        sub.setFont(new Font("Arial", Font.PLAIN, 15));
        sub.setSize(100, 32);
        sub.setLocation(125, 185);
        sub.addActionListener(this);
        c.add(sub);

        reset = new JButton("Reset");
        reset.setFont(new Font("Arial", Font.PLAIN, 15));
        reset.setSize(100, 32);
        reset.setLocation(250, 185);
        reset.addActionListener(this);
        c.add(reset);

        tout = new JTextArea();
        tout.setFont(new Font("Comic", Font.BOLD, 14));
        tout.setSize(185, 150);
        tout.setLocation(280, 400);
        tout.setLineWrap(true);
        tout.setEditable(false);
        tout.setBorder(BorderFactory.createLineBorder(Color.black));
        c.add(tout);

        res = new JLabel("");
        res.setFont(new Font("Comic", Font.BOLD, 14));
        res.setSize(150, 100);
        res.setLocation(290, 420);
        res.setBorder(BorderFactory.createLineBorder(Color.black));
        c.add(res);

        resadd = new JTextArea();
        resadd.setFont(new Font("Comic", Font.BOLD, 14));
        resadd.setSize(150, 100);
        resadd.setLocation(290, 420);
        resadd.setLineWrap(true);
        c.add(resadd);

        setVisible(true);
    }


    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == sub) {
            String color =tname.getText().toLowerCase();
            clips.eval("(assert (color "+color+"))");

            long run = clips.run();
            if(run>0)  System.out.println("\n----------------------------------------------------\n");
            else System.out.println("No Country have this color\n----------------------------------------------------");
            clips.clear();
            clips.load("p2.clp");
            clips.reset();
            for (String s : arr) {
                clips.eval(s);
            }
        }
        else if (e.getSource() == reset) {
            String def = "";
            tname.setText(def);
        }

        else if (e.getSource() == AddColor) {
            String color =tname3.getText().toLowerCase();
            colors+=color+" ";
            colorsForPrinting+="Color "+color+" Added\n";
            resadd.setText(colorsForPrinting);
            String def = "";
            tname3.setText(def);
        }

        else if (e.getSource() == Assert) {
            if (tname2.getText().length()==0) resadd.setText("Enter Country");
            else if(colors.length()==0) resadd.setText("Enter Colors");
            else {
                clips.clear();
                clips.load("p2.clp");
                clips.reset();
                arr.add("(assert (Countries (Country "+tname2.getText().toString()+") (Flag-Color "+colors+")))");
                for (String s : arr) {
                    clips.eval(s);
                }
                resadd.setText("Country Added");
                colors="";
                colorsForPrinting="";
            }
        }
    }
}
