classdef Osoba < handle
    properties(SetAccess = protected)
        name, 
        surname, 
        personalNumber
    end
    
    methods
        function obj = Osoba(paName, paSurname, paPersonalNumber)
            obj.name = paName;
            obj.surname= paSurname;
            obj.personalNumber = paPersonalNumber;
        end
        
        function reName = get.name(obj)
            reName = obj.name;
        end
        
        function reSurname = get.surname(obj)
            reSurname = obj.surname;
        end
        
        
        function rePersonalNumber = get.personalNumber(obj)
            rePersonalNumber = obj.personalNumber;
        end
        
        
        function set.name(obj, paName)
            obj.name = paName;
        end
        
        
        function set.surname(obj, paSurname)
            obj.surname = paSurname;
        end
        
        function set.personalNumber(obj, paPersonalNumber)
            obj.personalNumber = paPersonalNumber;
        end
        
        function show(obj)
            fprintf("Name: %s\n", obj.name);
            fprintf("Surname: %s\n", obj.surname);
            fprintf("Personal Number: %d\n", obj.personalNumber);
        end
    end
end

