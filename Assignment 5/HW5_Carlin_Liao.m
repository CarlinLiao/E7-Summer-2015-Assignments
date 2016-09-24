%% E7 - Assignment 5 - Carlin Liao

%% 1. 2D Plotting

% Part a
topLeft = subplot(2,2,1);
right = subplot(2,2,[2 4]);
botLeft = subplot(2,2,3);

% Part b
axes(topLeft);
x = linspace(1,4,100);
plot(x,exp(-x).*cos(5*x))

% Part c
clear all
subplots3 = [subplot(3,3,1),subplot(3,3,2),subplot(3,3,3),subplot(3,3,[4 4.5]),subplot(3,3,[5.5 6]),subplot(3,3,[7 9])];
x=0:0.01:4;
for p = -2:3
    axes(subplots3(p+3));
    plot(x,sin(x*p).*x.^p);
end


%% 2. 3D Plotting

clear all
x = linspace(-2,2);
y = linspace(-1,4,50);
[x y] = ndgrid(x,y);
z = -(x.*y)./exp(x.^2.+.5*y.^2);
surf(x,y,z);
title('Surface Plot');
xlabel('x');
ylabel('y');
zlabel('z')

%% 3. Inset of Plot Expansion
% My plot is *really close*, but not IDENTICAAAAAAL

clf
x = linspace(.001,10,10000);
y1 = sin(x);
y2 = exp(-x./3)-1;
y3 = cos(1./(x+0.05));

H = plot(x,y1,x,y2,x,y3);
set(H(1),'LineWidth',2);
set(H(2),'LineWidth',3);
legend('y1','y2','y3','Location','SouthEast')

magnifyingGlass(gca,[0.001 0.1],[.6 .6 .25 .25])


%% 4. Cell and Struct Arrays

[Caa, Chv, Chvc] = createCell3by2()


%% 5. 

Scores = struct('Name', 'def', 'TaskScores', {[6 1 8]});
Scores(2) = struct('Name', 'ABC', 'TaskScores', {[3 5 9]});
Scores(3) = struct('Name', 'DEF', 'TaskScores', [9 9 10]);
TaskWeights = [ .1 0 10 ];

[ScoresWeighted B90] = AddWeights(Scores,TaskWeights)


%% 6. Creating a Word Index

InitializeIndex();

%% 7. Creating a Word Index

Doc1 = {'Matlab', 'is', 'awesome'};
Doc2 = {'Programming', 'is', 'very', 'very', 'fun'};
Doc3 = {'I', 'love', 'Matlab'};

E7 = InitializeIndex();
E7 = InsertDoc(E7, Doc1, 1);
E7 = InsertDoc(E7, Doc2, 2);
E7 = InsertDoc(E7, Doc3, 3);

% load('SongLyrics.mat');
% LyricIndex = InitializeIndex();
% for i = 1:length(SongLyrics)
%     LyricIndex = InsertDoc(LyricIndex,SongLyrics(i).Lyrics,i);
% end


%% 8.

% locs = FindWordsInIndex(LyricIndex,'Johnny');
% locsAll = FindWordsInIndex(LyricIndex,{'I','Love','You'});

