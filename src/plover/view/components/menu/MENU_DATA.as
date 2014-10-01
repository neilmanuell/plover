package plover.view.components.menu
{
public const MENU_DATA:XML =
        <root>
            <menuitem label="File">
                <menuitem id="importImages" label="open"
                keyEquivalent="o" controlKey="true"/>
                <menuitem id="closeBook" label="close"
                keyEquivalent="w" controlKey="true"/>
                <menuitem id="saveBook" label="save"
                keyEquivalent="s" controlKey="true"/>
                <menuitem id="exitApp" label="quit"
                keyEquivalent="q" controlKey="true"/>
                <menuitem type="separator"/>

            </menuitem>
            <menuitem label="View">
                <menuitem id="viewSlideShow" label="view slide show"
                keyEquivalent="f" controlKey="true"/>
                <menuitem id="viewEditor" label="view editor"
                keyEquivalent="e" controlKey="true"/>
            </menuitem>
            <menuitem label="Settings">
                <menuitem id="editSettings" label="bitmap memory"
                keyEquivalent="m" controlKey="true"/>
                <menuitem type="separator"/>
                <menuitem id="relativeDrag" label="relative drag" type="check" toggled="false"/>
                <menuitem id="relativeTweenedDrag" label="relative tweened drag" type="check" toggled="true"/>
                <menuitem id="absoluteDrag" label="absolute drag" type="check" toggled="false"/>
                <menuitem id="absoluteTweenedDrag" label="absolute tweened drag" type="check" toggled="false"/>
            </menuitem>
        </root>

}
