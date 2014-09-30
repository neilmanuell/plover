package plover.view.components.dialogues
{

import spark.components.Panel;
import spark.components.ProgressBar;

import tools.signals.Signal0;

public class ProgressDialogueBase extends Panel
{
    public const cancelRequest:Signal0 = new Signal0();

    public var loadProgressBar:ProgressBar;

    public function set totalLoadProgress( value:Number ):void
    {
        loadProgressBar.totalProgress = value;
    }

    public function set loadProgress( value:Number ):void
    {
        loadProgressBar.currentProgress = value;

    }

    protected function createLabel():void
    {

    }
}
}
