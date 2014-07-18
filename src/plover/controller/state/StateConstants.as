package plover.controller.state
{
public class StateConstants
{
    public static const BOOTSTRAPING:String = "state/bootstrapping";
    public static const START_APPLICATION:String = "event/startApplication";
    public static const BOOTSTRAP:String = "event/bootstrap";

    public static const IDLING:String = "event/idling";
    public static const SETUP_IDLING:String = "event/setupIdling";
    public static const TEARDOWN_IDLING:String = "event/tearDownIdling";
    public static const IDLE:String = "action/idle";
    public static const IMPORT:String = "action/importImages";
    public static const EXIT_APPLICATION:String = "action/exitApplication";


    public static const IMPORTING:String = "state/importing";
    public static const SETUP_IMPORTING:String = "event/setUp/importing";
    public static const TEARDOWN_IMPORTING:String = "event/tearDown/importing";
    public static const INIT_IMPORTING:String = "event/init/importing";

    public static const EXITING_APPLICATION:String = "state/exitingApplication";
    public static const SETUP_EXITING_APPLICATION:String = "event/setUp/exitingApplication";
    public static const INIT_EXITING_APPLICATION:String = "event/init/exitingApplication";


    public static const FSM:XML = <fsm initial={IDLING}>

        <!-- THE INITIAL STATE -->
        <state name={BOOTSTRAPING} changed={BOOTSTRAP}>

            <transition action={START_APPLICATION}
            target={IDLING}/>

        </state>

        <state name={IDLING} entering={SETUP_IDLING} exiting={TEARDOWN_IDLING}>

            <transition action={IMPORT} target={IMPORTING}/>
            <transition action={EXIT_APPLICATION} target={EXITING_APPLICATION}/>

        </state>


        <state name={IMPORTING} entering={SETUP_IMPORTING} exiting={TEARDOWN_IMPORTING} changed={INIT_IMPORTING}>

            <transition action={IDLE} target={IDLING}/>

        </state>

        <state name={EXITING_APPLICATION} entering={SETUP_EXITING_APPLICATION} changed={INIT_EXITING_APPLICATION}>



        </state>
    </fsm>;
}
}
