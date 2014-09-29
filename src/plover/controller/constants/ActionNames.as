package plover.controller.constants
{
public class ActionNames
{
    public static const IMPORT_IMAGES:String = "importImages";
    public static const EDIT_SETTINGS:String = "editSettings";
    public static const EXIT_APP:String = "exitApp";
    public static const CLOSE:String = "closeBook";
    public static const SAVE:String = "saveBook";

    public static const RELATIVE_DRAG_CONTROL:String = "relativeDrag";
    public static const ABSOLUTE_DRAG_CONTROL:String = "absoluteDrag";
    public static const DELAYED_DRAG_CONTROL:String = "delayedDrag";

    public static const DRAG_CONTROLLERS:Array =
            [
                RELATIVE_DRAG_CONTROL,
                ABSOLUTE_DRAG_CONTROL,
                DELAYED_DRAG_CONTROL
            ]
}
}
