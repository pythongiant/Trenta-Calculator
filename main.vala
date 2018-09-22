Gtk.Button cusButton(string label,Gtk.Grid grid,int left, int top, int width , int height ){
    var button  = new Gtk.Button.with_label(label);    
    button.show();
    grid.attach(button,left,top,width,height);
    return button;
    
}
    

public class window:Gtk.ApplicationWindow{
    internal window(MyApplication app){
        Object (application:app,title:"TCalc");
        var grid = new Gtk.Grid();
        //Row 1
        var clear_button = cusButton("AC",grid,0,1,1,1);
        var clear_button = cusButton("AC",grid,0,1,1,1);
        var clear_button = cusButton("AC",grid,0,1,1,1);
        var clear_button = cusButton("AC",grid,0,1,1,1);
        /*
        var back_button = cusButton("<-");
        var perc_button = cusButton("%");
        var divide_button = cusButton("/");
        //Row 2
        var sev_button   = cusButton("7");
        var eight_button = cusButton("8");
        var nine_button  = cusButton("9");
        var multi_button = cusButton("X");
        //Row 3
        var four_button = cusButton("4");
        var five_button = cusButton("5");
        var six_button  = cusButton("6");
        var sub_button  = cusButton("-");
        //Row 4
        var one_button   = cusButton("1");
        var two_button   = cusButton("2");
        var three_button = cusButton("3");
        var plus_button  = cusButton("+");
        //Row 5
        var zero_button  = cusButton("0");
        var dot_button   = cusButton(".");
        var equal_button = cusButton("=");
        


        
        //Row 1
        var clear_button  = new Gtk.Button.with_label("AC");
        
        var    = new Gtk.Button.with_label("<-");
        var    = new Gtk.Button.with_label("%");
        var  = new Gtk.Button.with_label("/");
        //Row 2
        var sev_button   = new Gtk.Button.with_label("7");
        var eight_button = new Gtk.Button.with_label("8");
        var nine_button = new Gtk.Button.with_label("9");
        var multi_button = new Gtk.Button.with_label("X");
        //Row 3
        var four_button = new Gtk.Button.with_label("4");
        var five_button = new Gtk.Button.with_label("5");
        var six_button = new Gtk.Button.with_label("6");
        var sub_button = new Gtk.Button.with_label("-");
        //Row 4
        var one_button   = new Gtk.Button.with_label("1");
        var two_button     = new Gtk.Button.with_label("2");
        var three_button = new Gtk.Button.with_label("3");
        var plus_button  = new Gtk.Button.with_label("+");
        //Row 5
        var zero_button  = new Gtk.Button.with_label("0");
        var dot_button   = new Gtk.Button.with_label(".");
        var equal_button = new Gtk.Button.with_label("=");
        
        //Show
        //Row1
        clear_button.show() ;
        back_button.show()  ;
        perc_button.show()  ;
        divide_button.show();
        //Row 2
        sev_button.show();
        eight_button.show();
        nine_button.show();
        multi_button.show();
        //Row 3
        four_button.show();
        five_button.show();
        six_button.show();
        sub_button.show();
        //Row 4
        one_button.show() ;
        two_button.show()  ;      
        three_button.show();
        plus_button.show(); 
        //Row 5
        zero_button.show() ;
        dot_button.show() ;
        equal_button.show();
         */
        this.add (grid);
        /*
        grid.attach(clear_button,0,1,1,1);
        
        grid.attach(back_button,1,1,1,1);
        grid.attach(perc_button,2,1,1,1);
        grid.attach(divide_button,0,2,1,1);

        grid.attach(sev_button,1,2,1,1);
        grid.attach(eight_button,2,2,1,1);
         */
		grid.show();
    }
}

public class MyApplication : Gtk.Application { 
    protected override void activate(){
        new window (this).show();
    }
    internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

}
public static int main(string[] args) {
    return new MyApplication().run(args);
    
}
