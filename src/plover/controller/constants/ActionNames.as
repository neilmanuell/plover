package plover.controller.constants
{
public class ActionNames
{
    public static const IMPORT_IMAGES:String = "importImages";
    public static const EDIT_SETTINGS:String = "editSettings";
    public static const EXIT_APP:String = "exitApp";
    public static const CLOSE:String = "closeBook";
    public static const SAVE:String = "saveBook";
    public static const VIEW_SLIDES_SHOW:String = "viewSlideShow";
    public static const VIEW_EDITOR:String = "viewEditor";

    private static const RELATIVE_DRAG_CONTROL:String = "relativeDrag";
    private static const RELATIVE_TWEENED_DRAG_CONTROL:String = "relativeTweenedDrag";
    private static const ABSOLUTE_DRAG_CONTROL:String = "absoluteDrag";
    private static const ABSOLUTE_TWEENED_DRAG_CONTROL:String = "absoluteTweenedDrag";

    public static const DRAG_CONTROLLERS:Array =
            [
                RELATIVE_DRAG_CONTROL,
                RELATIVE_TWEENED_DRAG_CONTROL,
                ABSOLUTE_DRAG_CONTROL,
                ABSOLUTE_TWEENED_DRAG_CONTROL
            ]
}
}
