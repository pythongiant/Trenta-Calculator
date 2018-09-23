
Gtk.Button cusButton(string label,Gtk.Box grid ){
    var button  = new Gtk.Button.with_label(label);    
    
    grid.pack_start(button,true,true,2);
    button.get_style_context().add_class("button");
    return button;   
}
void maisn(){
    print("hello");
}

public class window:Gtk.ApplicationWindow{
    internal window(MyApplication app){
        Object (application:app,title:"TCalc");
        this.set_default_size(220,350);
        
        
        this.window_position = Gtk.WindowPosition.CENTER;
        var parent = new Gtk.Box(Gtk.Orientation.VERTICAL,0);
        //Row 0
        var row0 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        
        Gtk.Entry entry = new Gtk.Entry ();
        entry.activate.connect(maisn);
		row0.pack_start(entry,true,true,0);
        //Row 1
        //int left, int top, int width , int height 
        var row1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var clear_button = cusButton("a",row1);
        var ac_button = cusButton("<",row1);
        var perc_button = cusButton("%",row1);
        var div_button = cusButton("/",row1);
        
        //Row 2
        var row2 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var sev_button = cusButton("7",row2);
        var eight_button = cusButton("8",row2);
        var nine_button = cusButton("9",row2);
        var multi_button = cusButton("x",row2);
        //Row 3
        var row3 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var four_button = cusButton("4",row3);
        var five_button = cusButton("5",row3);
        var six_button = cusButton("6",row3);
        var sub_button = cusButton("-",row3);
        //Row 4
        var row4 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var one_button = cusButton("1",row4);
        var two_button = cusButton("2",row4);
        var three_button = cusButton("3",row4);
        var plus_button = cusButton("+",row4);
        //Row 5
        var row5 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var zero_button = cusButton("0",row5);
        var deci_button = cusButton(".",row5);
        var ans_button = cusButton("=",row5);

        parent.pack_start(row0,true,true,5);
        parent.pack_start(row1,true,true,5);
        parent.pack_start(row2,true,true,5);
        parent.pack_start(row3,true,true,5);
        parent.pack_start(row4,true,true,5);
        parent.pack_start(row5,true,true,5);
        
        
        sev_button.clicked.connect(maisn);
        this.add(parent);
        

    }
    public static void reverse_label(Gtk.Button button) {
		button.label = button.label.reverse ();
	}
}

public class MyApplication : Gtk.Application { 
    protected override void activate(){
        
        //CSS
        string path = "style.css";
        var css_provider = new Gtk.CssProvider();
       
            try {
                css_provider.load_from_path(path);
                Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
                
            } catch (Error e) {
                
                error ("Cannot load CSS stylesheet: %s", e.message);
            }
        new window (this).show_all();
    }
    internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

}
public static int main(string[] args) {
    return new MyApplication().run(args);
    
}
 