package plover.view.components
{
import plover.model.settings.BitmapMemorySettings;

import spark.components.Form;
import spark.components.Panel;

import tools.signals.Signal0;

public class MemorySettingsFormBase extends Panel
{
    public const closeRequest:Signal0 = new Signal0();
    private var _dataProvider:BitmapMemorySettings;
    [Bindable]
    public function get dataProvider():BitmapMemorySettings
    {
        return _dataProvider;
    }

    public function set dataProvider( value:BitmapMemorySettings ):void
    {
        _dataProvider = value;
    }
}
}
