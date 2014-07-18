package plover.utils.maths
{

public function getHooksVelocity( current:Number, dest:Number, spring:Number, damp:Number, elas:Number ):Number
{
    elas += -spring * (current - dest);
    return elas *= damp;
}

}
