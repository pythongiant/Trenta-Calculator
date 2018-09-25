

public class window:Gtk.ApplicationWindow{
     string[] calcs={};

    public void perform_cal(){
        for(var i =0; i <= this.calcs.length;i++){
          print(this.calcs[i]+",");
        }
    }
    public bool containDec(){
        
        bool operation = false;
        for (var y =0; y <= this.calcs.length;y++){
           
            if(this.calcs[y] =="+"||this.calcs[y] =="\u2212"||this.calcs[y] =="\u00D7"){
                operation = true;
            }
        }
        return operation;
    } 
    public void clickButton(string lab,Gtk.Entry entry){
          var org_tex = entry.get_text();
          bool negative = false;
          //empty decimal point
          if(entry.get_text()=="" && lab == "\u2022"){
            entry.set_text("0.");  
            
          }
          //decimal point
         else if(lab =="\u2022"){
            
            entry.set_text(org_tex+".");
          }
          //everything else
         else if(lab =="+"||lab =="\u2212"||lab =="\u00D7"){
            this.calcs +=org_tex;
            entry.set_text("");    
        }
        else if(lab == "="){
            this.calcs +=org_tex;
            perform_cal();
            this.calcs = {};
        }
        else{
            
            entry.set_text(org_tex+lab);    
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
          button.clicked.connect(()=>this.clickButton(label,entry));
          return button;
      }
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
        //Sev Calc
        var spec_row = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);

        var clear_button = this.cusButton("C",spec_row,true,entry);
        var plus_min_button = this.cusButton("±",spec_row,true,entry);
        var perc_button = this.cusButton("%",spec_row,true,entry);
        var division = this.cusButton("\u00F7",spec_row,true,entry);

        //Row 1
        //int left, int top, int width , int height
        var row1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);

        var sev_button = this.cusButton("7",row1,false,entry);
        var eight_button = this.cusButton("8",row1,false,entry);
        var nine_button = this.cusButton("9",row1,false,entry);
        var mult_button = this.cusButton("\u00D7",row1,true,entry);


        //Row 2
        var row2 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);

        var four1_button = this.cusButton("4",row2,false,entry);
        var five2_button = this.cusButton("5",row2,false,entry);
        var six3_button = this.cusButton("6",row2,false,entry);
        var sub_button = this.cusButton("\u2212",row2,true,entry);

        //Row 3
        var row3 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var one_button = this.cusButton("1",row3,false,entry);
        var two_button = this.cusButton("2",row3,false,entry);
        var three_button =  this.cusButton("3",row3,false,entry);
        var plus_button = this.cusButton("+",row3,true,entry);

        //Row 4
        var row5 = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
        var zero_button = this.cusButton("0",row5,false,entry);
        var exp_zero = new Gtk.Button.with_label("⠀");//Expand the 0 button (temporary)

        exp_zero.get_style_context().add_class("zero");
        row5.pack_start(exp_zero,true,true,0);
        var deci_button = this.cusButton("\u2022",row5,false,entry);
        var ans_button = this.cusButton("=",row5,true,entry);

        parent.pack_start(row0,true,true,0);
        parent.pack_start(spec_row,true,true,0);
        parent.pack_start(row1,true,true,0);
        parent.pack_start(row2,true,true,0);
        parent.pack_start(row3,true,true,0);
        parent.pack_start(row5,true,true,0);
        this.add(parent);


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
		Object (application_id: "io.trenta.calculator");
	}

}
public static int main(string[] args) {
    return new MyApplication().run(args);

}
