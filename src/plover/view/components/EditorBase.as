package plover.view.components
{
import mx.collections.IList;
import mx.containers.Canvas;

public class EditorBase extends Canvas
{
    private var _dataProvider:IList;
    [Bindable]
    public function get dataProvider():IList
    {
        return _dataProvider;
    }

    public function set dataProvider( value:IList ):void
    {
        _dataProvider = value;
    }
}
}
