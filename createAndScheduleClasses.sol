//SPDX-License-Identifier:GPL-3.0
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
          string  Duration;
          string  ClassType;// class is one time or repeating
          string  DateAndTime;
          string  classMode;
    }
    mapping(address=>ClassStruct) ClassDetails;
    mapping(address=>uint32) private Count;
    ClassStruct[] arr;
    function CreateAndScheduleClasses(string memory _ImageUrl,string memory _ClassName,string memory _Category,string memory _SubCategory,
         string memory _ClassLevel, string memory _Description,string memory _Location,string memory _DateAndTime,string memory _Duration,string memory _ClassType,
         string memory _classMode) public 
    {
         ClassDetails[msg.sender].ImageUrl=_ImageUrl;
         ClassDetails[msg.sender].ClassName=_ClassName;
         ClassDetails[msg.sender].Category=_Category;
         ClassDetails[msg.sender].SubCategory=_SubCategory;
         ClassDetails[msg.sender].ClassLevel=_ClassLevel;
         ClassDetails[msg.sender].Description=_Description;
         ClassDetails[msg.sender].Location=_Location;
         ClassDetails[msg.sender].Duration=_Duration;
         ClassDetails[msg.sender].ClassType=_ClassType;
         ClassDetails[msg.sender].DateAndTime=_DateAndTime;
         ClassDetails[msg.sender].studioWalltetAddress=msg.sender;
         ClassDetails[msg.sender].classMode=_classMode;
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