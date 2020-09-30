trigger checkOrder on Account (before insert) {
Account a=trigger.new[0];
a.NumberOfEmployees=1;
}