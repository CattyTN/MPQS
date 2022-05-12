function [v_Image,v_Alpha,BoidsPlot,fHandler]=InitializeGraphics()
global EnvironmentWidth;
global ImageWidth;
global BoidsNum;
global Boids;

[v_Image, ~, v_Alpha]	= imread('bird_b.png');
v_Image = imresize(v_Image, [ImageWidth ImageWidth], 'lanczos3' );
v_Alpha = imresize(v_Alpha, [ImageWidth ImageWidth], 'lanczos3' );

fHandler = figure;
fHandler.Color = 'white';
fHandler.MenuBar =  'none';
fHandler.ToolBar = 'none';
fHandler.Name = 'UNSW - Boids implementation';
fHandler.NumberTitle = 'off';
rectangle('position',[-EnvironmentWidth -EnvironmentWidth 2*EnvironmentWidth 2*EnvironmentWidth],'EdgeColor','b','LineWidth',1);
hold on
xlabel('X axis')
ylabel('Y axis')
axis manual;
%axis off;
%axis([-EnvironmentMargin EnvironmentWidth+EnvironmentMargin -EnvironmentMargin EnvironmentWidth+EnvironmentMargin]);
axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);

for BoidIndex = 1 : BoidsNum
    angle = atan(Boids(BoidIndex,2) / Boids(BoidIndex,1)) * 180 / pi - 90;	% imrotate rotates ccw     
    img_i = imrotate(v_Image, angle);
    alpha_i = imrotate(v_Alpha, angle );
    BoidsPlot(BoidIndex) = image(Boids(BoidIndex,1)- ImageWidth/2, Boids(BoidIndex,2)-ImageWidth/2, img_i);
    BoidsPlot(BoidIndex).AlphaData = alpha_i;   
end
