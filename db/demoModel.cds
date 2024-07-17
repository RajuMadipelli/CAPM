namespace ust.demo;
using { reuse.data as reuse } from './reuse';
using { cuid,managed,temporal } from '@sap/cds/common';

context master{
    entity student:reuse.address {
        key id:String(20);
        firstname:String(20);
        lastname:String(20);
        age:Int32;
        class:Association to semester;
    }
    entity semester{
        key id : String(32);
        name: String(30);
        specialization: String(80);
        hod: String(44);
    }

}
context transaction {
    entity subs:cuid,managed,temporal {
        student:Association to one master.student;
        
    }
}