% This script will identify whuch earthquakes are aftershocks
%
% processEQs.m
% Suvam S Patel
% 10/23/2019

% load data
data = load('hs_1981_2011_06_comb_K2_A.cat_so_SCSN_v01');

% load coast
coast = load('ca_lonLat.xyz');

% make matrix for epicenter location of main shock
northridge = [-118.535 34.207]
northridedata=[];
northridgeaShock=[];
northridgefShock=[];

%Initialize aftershock matrix
aShock = [];

%Get the number of rows (and columns) of data
[nrows, ncols] = size(data);

%Starts a timer in matlab
tic

%Go through all rows of the dataset “data”
for i=1:nrows
    
    %check latitude and longitude (should fall within the provided range)
    if data(i,8)>= 33.8 && data(i,8)<=34.8 && data(i,9)>=-119.0 && data(i,9)<=-118.0
            
            %OK we are at the right location, now check the year
            if data(i,1)==1994,
                
                %Now check the month
                if data(i,2)==1,
                    
                    %Need to check the day as well….
                    if data(i,3)>=17,
                        % we found a shock that fulfills all conditions!
                        % Add the entire row of data to aShock
                        aShock = [aShock;data(i,:)];
                    end
                    
                elseif data(i,2)==2,
                    
                elseif data(i,2)==3,
                    
                elseif data(i,2)==4,
                    
                elseif data(i,3)<=27,
                    
                end
            end
        end
    end

        
% Initialize foreshock matrix
fShock = [];

% Get the number of rows (and columns) of data
[nrows, ncols] = size(data);

%go through all rows of th dataset "data"
for i=1:nrows
    
    %check latitude and longitude
    if data(i,8)>= 33.8 && data(i,8)<=34.8 && data(i,9)>=-119.0 && data(i,9)<=-118.0
            
            %check the year
            if data(i,1)==1993,
                
                %check the month
                if data(i,2)==10,
                    
                    %check the day
                    if data(i,3)>=9,
                        
                        fShock = [fShock;data(i,:)];
                       
                    end
                    
                elseif data(i,2)==11
                    
                elseif data(i,2)==12
                    
                elseif data(i,2)==1
                    
                elseif data(i,3)<=16
                    
                end
            end
        end
    end
for i=1:nrows
    
    %check latitude and longitude
    if data(i,8)>=30.0 && data(i,8)<=37.6 && data(i,9)>=-122.5.0 && data(i,9)<=-113.0
            
            %check the year
            if data(i,1)==1993,
                
                %check the month
                if data(i,2)==10,
                    
                    %check the day
                    if data(i,3)>=9,
                        
                       northridgeaShock = [northridgeaShock;data(i,:)];
                       
                    end
                    
                elseif data(i,2)==11
                    
                elseif data(i,2)==12
                    
                elseif data(i,2)==1
                    
                elseif data(i,3)<=16
                    
                end
            end
        end
    end
for i=1:nrows
    
    %check latitude and longitude
    if data(i,8)>=33.8 && data(i,8)<=34.8 && data(i,9)>=-119.0 && data(i,9)<=-118.0
            
            %check the year
            if data(i,1)==1993,
                
                %check the month
                if data(i,2)==10,
                    
                    %check the day
                    if data(i,3)>=9,
                        
                        northridgefShock = [northridgefShock;data(i,:)];
                       
                    end
                    
                elseif data(i,2)==11
                    
                elseif data(i,2)==12
                    
                elseif data(i,2)==1
                    
                elseif data(i,3)<=16
                    
                end
            end
        end
end

fprintf('Loaded %d Total Earhtquakes \n',length(data))
fprintf('Found %d aftershocks \n',length(aShock))
fprintf('Found %d potential foreshocks \n',length(fShock))
fprintf('Found %d northridge aftershocks \n',length(northridgeaShock))
fprintf('Found %d potential northridge foreshocks \n',length(northridgefShock))
toc

%Figure 1
figure(1);
plot(data(:,9),data(:,8),'r.');
hold on 
plot(aShock(:,9),aShock(:,8),'b.');
hold on 
plot(fShock(:,9),fShock(:,8),'go','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',5);
hold on 
plot(northridge,'yp','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',12)
hold on

%Figure 2
figure(2); 
plot(data(:,9),data(:,8),'r.');
hold on
plot(northridgeaShock(:,9),northridgeaShock(:,8),'b.');
hold on 
plot(northridgefShock(:,9),northridgefShock(:,8),'go','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',5);
hold on 
plot(northridge,'yp','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',12)
hold on

                