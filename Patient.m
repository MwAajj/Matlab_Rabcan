classdef Patient < Osoba
    properties(SetAccess = private)
        date 
        positive
    end
    
    methods
        function obj = Patient(paName, paSurname, paPersonalNumber, paDate)
            obj@Osoba(paName, paSurname, paPersonalNumber);
            obj.date = paDate;
            obj.positive = true;
        end
        
        function reDate = get.date(obj)
            reDate = obj.date;
        end
        
        function rePositive = get.positive(obj)
            rePositive = obj.positive;
        end
        
        function setPositive(obj, paPositive)
            obj.positive = paPositive;
        end
        
        function setDate(obj, paDate)
            obj.date = paDate;
        end
        
        function show(obj)
            show@Osoba(obj);
            disp(datestr(datetime(obj.date,'InputFormat','yyyy-MM-dd')));
        end
            
    end
end

