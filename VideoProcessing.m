fprintf('Welcome\n\n');
% Read the video
myvid=VideoReader('Road.mp4');
% Get the video data
f=myvid.NumberOfFrames;
h=myvid.Height;
w=myvid.Width;
% Make atruct to store video frames
arr(1:f)=struct('cdata',zeros(h,w,3,'uint8'),'colormap',[]);
% Initiliaze the frames struct to play the video in normal mode
for i=1:f
    arr(i).cdata=read(myvid,i);
end
    % Create figure to play the video in normal mode
     fig=figure('Name','Playing In Normal Mode','NumberTitle','off');
    set(fig,'position',[0 50 w h ]);
fprintf('Normal video\n\n');
 movie(fig,arr,1,myvid.FrameRate);

   
    % Create figure to play the video in fast, normal or slow  mode (The user chooses)
a = input('Enter the desired video speed value (0.1 -> 0.9 = Slow , 1 = Normal, 1.1 -> + Infinity = Fast)\n');
% Set the figure statement by the user choose (Normal , Fast , Slow)
        for i=1:f
            arr(i).cdata=read(myvid,i);
        end
            if(a<1)
    fig= figure('Name','Playing In Slow Mode','NumberTitle','off');
    fprintf('Video In Slow Mode\n\n');
    end
if(a>1)
fig= figure('Name','Playing In Fast Mode','NumberTitle','off');
fprintf('Video In Fast Mode\n\n');
    end
if(a==1)
fig= figure('Name','Playing In Normal Mode','NumberTitle','off');
fprintf('Video In Normal Mode\n\n');
    end
    set(fig,'position',[150 150 w h ]);
   
    movie(fig,arr,1,a*myvid.FrameRate);
    
    


% Create figure to play the video gray mode
  for i=1:f
        arr(i).cdata=read(myvid,i);
        I=rgb2gray(arr(i).cdata);
        arr(i).cdata(:,:,1)=I;
        arr(i).cdata(:,:,2)=I;
        arr(i).cdata(:,:,3)=I;
    end
       fig=figure('Name','Playing In Gray Mode','NumberTitle','off');
    set(fig,'position',[800 50 w h ]);
   fprintf('Video In Gray Mode\n\n');
    movie(fig,arr,1,myvid.FrameRate);
    
       % Create figure to play video from start to frame the user choose it
   arr(1:f)=struct('cdata',zeros(h,w,3,'uint8'),'colormap',[]);
   choosenf=input('Enter frame you want to play video from start to it\n');
    for i=1:choosenf  
    arr(i).cdata=read(myvid,i);
    end
    
     fig=figure('Name',strcat('Playing video from frame 1 to ',num2str(choosenf)),'NumberTitle','off');
    set(fig,'position',[150 150 w h ]);
    fprintf(' Video from frame 1 to %f\n\n',choosenf);
    movie(fig,arr,1,myvid.FrameRate);
    

    
    
% Create figure to play the video reverse mode
        for i=1:f
            arr(f-i+1).cdata=read(myvid,i);
            end
        fig=figure('Name','Playing In Reverse Mode','NumberTitle','off');
    set(fig,'position',[150 150 w h ]);
    fprintf('Video In Reverse Mode\n\n');
    movie(fig,arr,1,myvid.FrameRate);
    
             % Ask the user to extract the frames 
ask = input('Do you want to extract the frames ? (Yes or No)\n' ,'s');
if(strcmp(ask,'Yes') || strcmp(ask,'yes'))
         for i=1:myvid.NumberOfFrames
fn=strcat('frame',num2str(i),'.jpg');
b=read(myvid,i);
imwrite(b,fn);
         end
         fprintf('The frames extracted is finished\n\n');
end




  % Create figure to divide video
    n=input('Enter  number of parts you want to divide video \nNotice! you should enter number that divided on number of frames: 365 \n');
fr=round(f/n);
arr(1:n,1:fr)=struct('cdata',zeros(h,w,3,'uint8'),'colormap',[]);
for l=1:1:n
for i=1:1:fr
    arr(l,i).cdata=read(myvid,(l-1)*fr+i);
end
end
 fig=figure('Name','Playing In Divided Mode','NumberTitle','off');
    set(fig,'position',[150 150 w h ]);
    oa(1:fr)=struct('cdata',zeros(h,w,3,'uint8'),'colormap',[]);
    for i=1:fr
        oa(i)=arr(2,i);
    end
    
         movie(fig,oa,1,myvid.FrameRate);

fprintf('Thanks alot\n\n');
return
