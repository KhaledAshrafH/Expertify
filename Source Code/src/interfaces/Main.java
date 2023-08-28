package interfaces;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Main {

    public static void main(String[] args) {
        System.out.println("\n");
        new Home();
    }

}


class Home extends JFrame implements ActionListener {
    JButton E1, E2;
    Home() {
        setSize(400, 400);
        setLayout(null);
        setTitle("Clips Expert System");

        JLabel title = new JLabel("Expert Systems");
        title.setFont(new Font("Arial", Font.BOLD, 24));
        title.setSize(200, 30);
        title.setLocation(95, 100);
        add(title);

        E1 = new JButton("Countries Flag Colors");
        E1.setFont(new Font("Arial", Font.BOLD, 18));
        E1.setFocusPainted(true);
        E1.setBounds(65, 175, 250, 30);
        E1.addActionListener(this);

        E2 = new JButton("Gpa Calculation");
        E2.setFont(new Font("Arial", Font.BOLD, 18));
        E2.setFocusPainted(true);
        E2.setBounds(65, 220, 250, 30);
        E2.addActionListener(this);

        add(E1);
        add(E2);
        setResizable(false);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==E1) new CountriesFlagColors();
        else if (e.getSource()==E2) new CalcGPA();
    }


}