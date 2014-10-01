package plover.controller.cmds.importing
{
import plover.model.files.ImportFileModel;
import plover.model.settings.RecentlyOpenedList;

public class AddFileToRecentList
{
    [Inject]
    public var list:RecentlyOpenedList;

    [Inject]
    public var model:ImportFileModel;


    public function execute():void
    {
        list.addFile( model.parent );
    }
}
}
