/*
TODO:
1) fix css
2) actually perform calculations
3) make README
4) Decide on license
*/
void clickButton(string args,Gtk.Entry entry){
    if (args != "="){
    string orgText = entry.get_text();
    entry.set_text(orgText + args);
}
}

Gtk.Button cusButton(string label,Gtk.Box grid,bool right,Gtk.Entry entry ){
    var button  = new Gtk.Button.with_label(label);    
    
    grid.pack_start(button,true,true,0);
    if (!right){
        button.get_style_context().add_class("button");
    }
    else{
        button.get_style_context().add_class("left");
    }
    button.clicked.connect(()=>clickButton(label,entry));
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
        
        row0.pack_start(entry,true,true,0);
        entry.get_style_context().add_class("inp");
        //Row 1
        //int left, int top, int width , int height
        var row1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);

        var one_button = cusButton("7",row1,false,entry);
        var two_button = cusButton("8",row1,false,entry);
        var three_button = cusButton("9",row1,false,entry);
        var sub42_button = cusButton("\u00D7",row1,true,entry);
        
        
        //Row 2
        var row2 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        
        var four1_button = cusButton("4",row2,false,entry);
        var five2_button = cusButton("5",row2,false,entry);
        var six3_button = cusButton("6",row2,false,entry);
        var sub4_button = cusButton("\u2212",row2,true,entry);
        
        //Row 3
        var row3 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var four_button = cusButton("1",row3,false,entry);
        var five_button = cusButton("2",row3,false,entry);
        var six_button = cusButton("3",row3,false,entry);
        var sub_button = cusButton("+",row3,true,entry);
        
        //Row 4
        var row5 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var zero_button = cusButton("0",row5,false,entry);
        var deci_button = cusButton("\u2022",row5,false,entry);
        var perc_button = cusButton("%",row5,false,entry);
        var ans_button = cusButton("=",row5,true,entry);

        parent.pack_start(row0,true,true,0);
        parent.pack_start(row1,true,true,0);
        parent.pack_start(row2,true,true,0);
        parent.pack_start(row3,true,true,0);
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
 