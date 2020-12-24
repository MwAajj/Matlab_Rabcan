classdef Doctor < Osoba 
    properties(SetAccess = private)
        numberOfCured
        bonus
    end
    
    methods
        function obj = Doctor(paName, paSurname, paPersonalNumber)
            obj@Osoba(paName, paSurname, paPersonalNumber);
            obj.numberOfCured = 0;
            obj.bonus = 0;
        end
        
        function addCuredPatient(obj)
            obj.numberOfCured = obj.numberOfCured + 1;
            obj.bonus = obj.bonus + 500;
        end
        
        function reNumberOfCured = get.numberOfCured(obj)
            reNumberOfCured = obj.numberOfCured;
        end
        
        function reBonus = get.bonus(obj)
            reBonus = obj.bonus;
        end
        
        function show(obj)
             show@Osoba(obj);
             disp("Number of cured: %d" + obj.numberOfCured);
             disp("Total bonus: %d" + obj.bonus);
        end
    end
end

