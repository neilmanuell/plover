package tools.mouse
{
public class DragControllerMap
{
    private const _map:Object = {};
    private var _currentItem:DragController;
    private var _currentID:String;

    private var _enable:Boolean;

    public function get enabled():Boolean
    {
        return _enable;
    }

    public function set enabled( value:Boolean ):void
    {
        _enable = value;
        _currentItem.enabled = value;
    }

    public function set currentControl( value:String ):void
    {
        if ( value == _currentID )return;
        if ( _currentItem != null )
        {
            _currentItem.enabled = false;
        }

        _currentID = value;
        _currentItem = _map[_currentID];
        _currentItem.enabled = _enable;
    }

    public function add( controller:DragController, id:String ):void
    {
        _map[id] = controller
    }
}
}
