import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class TTT1 extends JFrame implements ItemListener, ActionListener {
    int i, j, ii, jj, x, y, yesnull;
    int a[][] = {{10, 1, 2, 3, 11}, {10, 1, 4, 7, 11}, {10, 1, 5, 9, 11}, {10, 2, 5, 8, 11},
            {10, 3, 5, 7, 11}, {10, 3, 6, 9, 11}, {10, 4, 5, 6, 11}, {10, 7, 8, 9, 11}};
    int a1[][] = {{10, 1, 2, 3, 11}, {10, 1, 4, 7, 11}, {10, 1, 5, 9, 11}, {10, 2, 5, 8, 11},
            {10, 3, 5, 7, 11}, {10, 3, 6, 9, 11}, {10, 4, 5, 6, 11}, {10, 7, 8, 9, 11}};

    boolean state, type, set;

    icon ic1, ic2, icon, ic11, ic22;
    checkbox c1, c2;
    jlabel l1, l2;
    jbutton b[] = new jbutton[9];
    jbutton reset;

    public void showbutton() {

        x = 10;
        y = 10;
        j = 0;
        for (i = 0; i <= 8; i++, x += 100, j++) {
            b[i] = new jbutton();
            if (j == 3) {
                j = 0;
                y += 100;
                x = 10;
            }
            b[i].setbounds(x, y, 100, 100);
            add(b[i]);
            b[i].addactionlistener(this);
        }//eof for

        reset = new jbutton("reset");
        reset.setbounds(100, 350, 100, 50);
        add(reset);
        reset.addactionlistener(this);

    }//eof showbutton

    public void check(int num1) {
        for (ii = 0; ii <= 7; ii++) {
            for (jj = 1; jj <= 3; jj++) {
                if (a[ii][jj] == num1) {
                    a[ii][4] = 11;
                }

            }//eof for jj

        }//eof for ii
    }//eof check

    public void complogic(int num) {

        for (i = 0; i <= 7; i++) {
            for (j = 1; j <= 3; j++) {
                if (a[i][j] == num) {
                    a[i][0] = 11;
                    a[i][4] = 10;
                }
            }
        }
        for (i = 0; i <= 7; i++) {                                // for 1
            set = true;
            if (a[i][4] == 10) {                                 //if 1
                int count = 0;
                for (j = 1; j <= 3; j++) {                                                //for 2
                    if (b[(a[i][j] - 1)].geticon() != null) {                               //if 2
                        count++;
                    }                                                                   //eof if 2
                    else {
                        yesnull = a[i][j];
                    }
                }                                                                         //eof for 2
                if (count == 2) {                                                        //if 2
                    b[yesnull - 1].seticon(ic2);
                    this.check(yesnull);
                    set = false;
                    break;
                }                                                                     //eof if 2
            }                                                                     //eof if 1
            else if (a[i][0] == 10) {
                for (j = 1; j <= 3; j++) {                                            //for2
                    if (b[(a[i][j] - 1)].geticon() == null) {                                          //if 1
                        b[(a[i][j] - 1)].seticon(ic2);
                        this.check(a[i][j]);
                        set = false;
                        break;
                    }                                                    //eof if1
                }                                                              //eof for 2
                if (set == false)
                    break;
            }//eof elseif

            if (set == false)
                break;
        }//eof for 1


    }//eof complogic

    ttt1() {
        super("tic tac toe by ashwani");

        checkboxgroup cbg = new checkboxgroup();
        c1 = new checkbox("vs computer", cbg, false);
        c2 = new checkbox("vs friend", cbg, false);
        c1.setbounds(120, 80, 100, 40);
        c2.setbounds(120, 150, 100, 40);
        add(c1);
        add(c2);
        c1.additemlistener(this);
        c2.additemlistener(this);


        state = true;
        type = true;
        set = true;
        ic1 = new imageicon("ic1.jpg");
        ic2 = new imageicon("ic2.jpg");
        ic11 = new imageicon("ic11.jpg");
        ic22 = new imageicon("ic22.jpg");

        setlayout(null);
        setsize(330, 450);
        setvisible(true);
        setdefaultcloseoperation(jframe.dispose_on_close);
    }//eof constructor

    public void itemstatechanged(itemevent e) {
        if (c1.getstate()) {
            type = false;
        } else if (c2.getstate()) {
            type = true;
        }
        remove(c1);
        remove(c2);
        repaint(0, 0, 330, 450);
        showbutton();
    }//eof itemstate

    public void actionperformed(actionevent e) {

        if (type == true)//logicfriend
        {
            if (e.getsource() == reset) {
                for (i = 0; i <= 8; i++) {
                    b[i].seticon(null);
                }//eof for
            } else {
                for (i = 0; i <= 8; i++) {
                    if (e.getsource() == b[i]) {

                        if (b[i].geticon() == null) {
                            if (state == true) {
                                icon = ic2;
                                state = false;
                            } else {
                                icon = ic1;
                                state = true;
                            }
                            b[i].seticon(icon);
                        }
                    }
                }//eof for
            }//eof else
        }//eof logicfriend
        else if (type == false) {                                     //  complogic
            if (e.getsource() == reset) {
                for (i = 0; i <= 8; i++) {
                    b[i].seticon(null);
                }//eof for
                for (i = 0; i <= 7; i++)
                    for (j = 0; j <= 4; j++)
                        a[i][j] = a1[i][j];   //again initialsing array
            } else {  //complogic
                for (i = 0; i <= 8; i++) {
                    if (e.getsource() == b[i]) {
                        if (b[i].geticon() == null) {
                            b[i].seticon(ic1);
                            if (b[4].geticon() == null) {
                                b[4].seticon(ic2);
                                this.check(5);
                            } else {
                                this.complogic(i);
                            }
                        }
                    }
                }//eof for
            }
        }//eof complogic

        for (i = 0; i <= 7; i++) {

            icon icon1 = b[(a[i][1] - 1)].geticon();
            icon icon2 = b[(a[i][2] - 1)].geticon();
            icon icon3 = b[(a[i][3] - 1)].geticon();
            if ((icon1 == icon2) && (icon2 == icon3) && (icon1 != null)) {
                if (icon1 == ic1) {
                    b[(a[i][1] - 1)].seticon(ic11);
                    b[(a[i][2] - 1)].seticon(ic11);
                    b[(a[i][3] - 1)].seticon(ic11);
                    joptionpane.showmessagedialog(ttt1.this, "!!!you won!!! click reset");
                    break;
                } else if (icon1 == ic2) {
                    b[(a[i][1] - 1)].seticon(ic22);
                    b[(a[i][2] - 1)].seticon(ic22);
                    b[(a[i][3] - 1)].seticon(ic22);
                    joptionpane.showmessagedialog(ttt1.this, "!!!awk (computer) won!!! click reset");
                    break;
                }
            }
        }


    }//eof actionperformed

    public static void main(string[] args) {
        new ttt1();
    }//eof main

}//eof class