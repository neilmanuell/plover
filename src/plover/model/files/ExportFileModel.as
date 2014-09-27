package plover.model.files
{
import flash.filesystem.File;

import plover.controller.constants.FileName;
import plover.utils.files.getURLSFromFiles;

public class ExportFileModel
{
       private var _list:File;

    public function get list():File
    {
        return _list;
    }

    private var _parent:File = File.documentsDirectory;

    public function get parent():File
    {
        return _parent;
    }

    public function setParentFile( parent:File ):void
    {
        _parent = parent;
        _list = _parent.resolvePath( FileName.PLOVER_LIST_FILE );
    }

    public function get listExists():Boolean
    {
        return (_list == null ) ? false : list.exists;
    }


}
}
