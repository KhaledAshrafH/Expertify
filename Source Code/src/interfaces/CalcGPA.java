package interfaces;

import net.sf.clipsrules.jni.Environment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.swing.Icon;

public class CalcGPA extends javax.swing.JFrame implements ActionListener {
    private Container c;
    private JLabel title;
    private JLabel name;
    private JLabel descriptionInput;
    private JLabel descriptionOutput;
    private JTextField tname;
    private JButton inputFile;
    private JButton outputFile;
    private JButton run;
    private JTextArea tout;
    private JLabel res;
    private JTextArea resadd;
    String inputPath="";
    String outputPath="";
    Environment clips;
    public CalcGPA() {
        clips = new Environment();
        clips.load("p3.clp");
        setTitle("Clips Expert System");
        setBounds(300, 90, 680, 540);
        setResizable(false);

        c = getContentPane();
        c.setLayout(null);

        title = new JLabel("GPA Calculation Expert System");
        title.setFont(new Font("Comic", Font.BOLD, 25));
        title.setSize(600, 30);
        title.setLocation(150, 30);
        c.add(title);


        inputFile = new JButton("Choose Input File");
        inputFile.setFont(new Font("Arial", Font.PLAIN, 15));
        inputFile.setSize(180, 30);
        inputFile.setLocation(60, 190);
        inputFile.addActionListener(this);
        c.add(inputFile);


        outputFile = new JButton("Choose Output Path");
        outputFile.setFont(new Font("Arial", Font.PLAIN, 15));
        outputFile.setSize(180, 30);
        outputFile.setLocation(60, 235);
        outputFile.addActionListener(this);
        c.add(outputFile);

        run = new JButton("Run");
        run.setFont(new Font("Arial", Font.PLAIN, 15));
        run.setSize(180, 30);
        run.setLocation(60, 280);
        run.addActionListener(this);
        c.add(run);

        tout = new JTextArea();
        tout.setFont(new Font("Arial", Font.PLAIN, 15));
        tout.setSize(300, 350);
        tout.setLocation(300, 100);
        tout.setLineWrap(true);
        tout.setEditable(false);
        tout.setBorder(BorderFactory.createLineBorder(Color.black));
        c.add(tout);

        res = new JLabel("");
        res.setFont(new Font("Arial", Font.PLAIN, 15));
        res.setSize(265, 300);
        res.setLocation(310, 120);
        res.setBorder(BorderFactory.createLineBorder(Color.black));
        c.add(res);

        resadd = new JTextArea();
        resadd.setFont(new Font("Arial", Font.PLAIN, 15));
        resadd.setSize(265, 300);
        resadd.setLocation(310, 120);
        resadd.setLineWrap(true);
        c.add(resadd);



        setVisible(true);
    }


    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == inputFile) {
            JFileChooser choiceInput = new JFileChooser();
            choiceInput.setCurrentDirectory(new java.io.File("."));
            choiceInput.setDialogTitle("Choose Input File");
            choiceInput.setFileSelectionMode(JFileChooser.FILES_ONLY);
            choiceInput.setAcceptAllFileFilterUsed(false);

            if (choiceInput.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
                inputPath= String.valueOf(choiceInput.getSelectedFile());
                inputPath = inputPath.replace("\\", "//");
                inputPath+="\"";
                inputPath="\""+inputPath;
                System.out.println(inputPath);
                resadd.setText("File Input Selected Successfully");
            }

        }


        else if (e.getSource() == outputFile) {
            JFileChooser choiceOutput = new JFileChooser();
            choiceOutput.setCurrentDirectory(new java.io.File("."));
            choiceOutput.setDialogTitle("Choose Output Path");
            choiceOutput.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
            choiceOutput.setAcceptAllFileFilterUsed(false);
            if (choiceOutput.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
                outputPath= String.valueOf(choiceOutput.getSelectedFile());
                outputPath = outputPath.replace("\\", "//");
                outputPath+="//output.txt\"";
                outputPath="\""+outputPath;
                System.out.println(outputPath);
                resadd.setText("File Output Path Selected Successfully");
            }
        }
        else if(e.getSource() == run){
            if(inputPath.length()>1 && outputPath.length()>1){
                clips.reset();
                clips.eval("(calcGPA "+inputPath+" "+outputPath+" )");
                clips.run();
                System.out.println("Program Running Successfully");
                try {
                    outputPath=outputPath.substring(1,outputPath.length()-1);
                    Path fileOutput  = Path.of(outputPath);
                    String outputFileStr =Files.readString(fileOutput);
                    resadd.setText(outputFileStr);
                } catch (IOException ex) {
                    throw new RuntimeException(ex);
                }

            }
            else System.out.println("You Should Select input and output files");
        }
    }
}
