// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
contract CreateScheduleClasses
    {
    struct ClassStruct
    {
          address studioWalltetAddress;
          string  ImageUrl;
          string  ClassName;
          string  Category;
          string  SubCategory;
          string  ClassLevel;
          string  Description;
          string  Location;
          string  classMode;
          string  DateAndTime;
          string  Duration;
          string  ClassType;// class is one time or repeating
          uint    ClassId;
    }
    uint ClassID=1;
    mapping(address=>ClassStruct) ClassDetails;
    mapping(address=>uint32) private Count;
    mapping(uint=>mapping(address=>ClassStruct)) private _ClassDetails;
    ClassStruct[] arr;
    function CreateAndScheduleClasses(string memory _ImageUrl,string memory _ClassName,string[] memory _Categories,
         string memory _ClassLevel, string memory _Description,string memory _Location,string memory _classMode,string memory _DateAndTime,string memory _Duration,
         string memory _ClassType) public 
    {
         ClassDetails[msg.sender]=ClassStruct(msg.sender,_ImageUrl,_ClassName,_Categories[0],_Categories[1],_ClassLevel,_Description,
         _Location,_classMode,_DateAndTime,_Duration,_ClassType,ClassID);
         ClassID+=1;
         arr.push(ClassDetails[msg.sender]);
         _ClassDetails[ClassID][msg.sender]=ClassDetails[msg.sender];
         Count[msg.sender]+=1;
    }
    function editClass(address _user,uint _ClassID,string memory _ImageUrl,string[] memory _ClassNameAnd_Categories,
         string memory _ClassLevel, string memory _Description,string memory _Location,string memory _classMode,string memory _DateAndTime,string memory _Duration,
         string memory _ClassType) public {
           require(_ClassDetails[_ClassID][_user].ClassId==_ClassID,"Such ID does not exist");
             _ClassDetails[_ClassID][_user]=ClassStruct(_user,_ImageUrl,_ClassNameAnd_Categories[0],_ClassNameAnd_Categories[1],_ClassNameAnd_Categories[2],_ClassLevel,
                _Description,_Location,_classMode,_DateAndTime,_Duration,_ClassType,_ClassID);
                ClassDetails[_user]=_ClassDetails[_ClassID][_user];
                for(uint i=0;i<arr.length;i++){
                  if(arr[i].ClassId==_ClassID){
                      arr[i]=ClassDetails[_user];
                  }
                }

         }
    function getClasses(address _user) public view returns(ClassStruct[] memory)
    {
         uint8 _index=0;
         uint32 count=Count[_user];
         ClassStruct[] memory arr1=new ClassStruct[](count);
    for(uint i=0;i<arr.length;i++)
    {
    if(arr[i].studioWalltetAddress==_user)
    {
          arr1[_index]=arr[i];
          _index+=1;
    }
    }     return arr1;
    }
    }