package plover.model.settings
{
import flash.filesystem.File;
import flash.net.SharedObject;

import plover.view.components.menu.MENU_DATA;

public class RecentlyOpenedList
{
    private const MAX:int = 3;

    public function RecentlyOpenedList()
    {
        _so = SharedObject.getLocal( "RecentlyOpenedSettings" );
        // _so.clear() ;
        if ( _so.data.lastUpdated == undefined )
        {
            _menuitem = <menuitem id="recentFolders" label="recent folders"/>;
            persist();
        }
        else
        {
            reset();
        }

        attachToMenu();
    }

    private var _menuitem:XML;
    private var _so:SharedObject;

    public function hasFile( file:File ):Boolean
    {
        const xmlList:XMLList = _menuitem.menuitem.(@url == file.url);
        return (xmlList.length() != 0);
    }

    public function addFile( file:File ):void
    {
        if ( hasFile( file ) ) return;
        addFileToMenu( file );
        reAssignKeyEquivs();
        persist();
    }

    public function persist():void
    {
        _so.data.lastUpdated = new Date().getTime();
        _so.data.menu = _menuitem.toXMLString();
        _so.flush();
    }

    public function reset():void
    {
        _menuitem = new XML( _so.data.menu );
    }

    public function getFileAt( index:int ):File
    {
        return new File( _menuitem.menuitem[index].@url.toString() );
    }

    private function reAssignKeyEquivs():void
    {
        const list:XMLList = _menuitem.menuitem;
        const len:int = list.length();
        for ( var i:int = 0; i < len; i++ )
        {
            list[i].@keyEquivalent = i;
        }
    }

    private function addFileToMenu( file:File ):void
    {
        _menuitem.prependChild( new XML( <menuitem id="recentFolder" label={file.name} url={file.url}  controlKey="true"/> ) );

        const len:int = _menuitem.menuitem.length();
        if ( len > MAX )
        {
            delete _menuitem.menuitem[len - 1];
        }
    }

    private function attachToMenu():void
    {
        const fileItem:XMLList = MENU_DATA.menuitem.(@label == "File");
        fileItem.appendChild( _menuitem );
    }
}
}
