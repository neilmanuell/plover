package tools.mouse
{
public interface DragControllerClient
{
    function get selectedIndex():int

    function set selectedIndex( value:int ):void

    function get remainder():Number

    function set remainder( value:Number ):void

    function get length():int

}
}
