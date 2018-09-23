/*
TODO:
1) fix css
2) actually perform calculations
3) make README
4) Decide on license
*/
void clickButton(string args){
    print(args);
 
}

Gtk.Button cusButton(string label,Gtk.Box grid,bool right ){
    var button  = new Gtk.Button.with_label(label);    
    
    grid.pack_start(button,true,true,1);
    if (!right){
        button.get_style_context().add_class("button");
    }
    else{
        button.get_style_context().add_class("left");
    }
    button.clicked.connect(()=>clickButton(label));
    return button;   
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
        entry.activate.connect(()=>maisn("YOLO"));
		row0.pack_start(entry,true,true,0);
        //Row 1
        //int left, int top, int width , int height 
        var row1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var clear_button = cusButton("a",row1,false);
        var ac_button = cusButton("<",row1,false);
        var perc_button = cusButton("%",row1,false);
        var div_button = cusButton("c",row1,true);
        
        //Row 2
        var row2 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var sev_button = cusButton("7",row2,false);
        var eight_button = cusButton("8",row2,false);
        var nine_button = cusButton("9",row2,false);
        var multi_button = cusButton("b",row2,true);
        //Row 3
        var row3 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var four_button = cusButton("4",row3,false);
        var five_button = cusButton("5",row3,false);
        var six_button = cusButton("6",row3,false);
        var sub_button = cusButton("a",row3,true);
        //Row 4
        var row4 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var one_button = cusButton("1",row4,false);
        var two_button = cusButton("2",row4,false);
        var three_button = cusButton("3",row4,false);
        var plus_button = cusButton("d",row4,true);
        //Row 5
        var row5 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var zero_button = cusButton("0",row5,false);
        var deci_button = cusButton(".",row5,false);
        var ans_button = cusButton("=",row5,true);

        parent.pack_start(row0,true,true,0);
        parent.pack_start(row1,true,true,0);
        parent.pack_start(row2,true,true,0);
        parent.pack_start(row3,true,true,0);
        parent.pack_start(row4,true,true,0);
        parent.pack_start(row5,true,true,0);
        
        
        
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
 