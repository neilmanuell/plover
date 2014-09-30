package tools.loaderservice.core
{
import flash.display.Sprite;
import flash.text.Font;

import tools.loaderservice.api.FontLibrary;

public class FontLibrary extends Sprite implements tools.loaderservice.api.FontLibrary
{
    private const _fontClasses:Vector.<Class> = new Vector.<Class>();

    public function add( fontClass:Class ):void
    {
        _fontClasses.push( fontClass );
    }

    public function install():Boolean
    {
        if ( _fontClasses.length == 0 )return false;
        for each( var font:Class in _fontClasses )
        {
            Font.registerFont( font );
        }
        return true;
    }
}
}
