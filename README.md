# Ranking-Presidential-Candidates
Compared PageRank method versus Borda count method, W-Borda, and plurality method in ranking candidates.

<img src="https://psmag.com/.image/t_share/MTU3ODk2MjI5MjUzMDMxMjQx/gettyimages-1020986360.jpg" alt="President Donald Trump arrives for a political rally at the Charleston Civic Center in Charleston, West Virginia, on August 21st, 2018."/>

PageRank Example:
First we create the Presidential election graph.
Then we construct and modify the matrix corresponding to the election graph. Finally, we compute
the vector containing the ranks of each candidate based on the number of votes. From this ranking
we predict who will be elected as president.


<img src="https://image.slidesharecdn.com/googlesearch-linearalgebrappt-150505020121-conversion-gate02/95/linear-algebra-behind-google-search-7-638.jpg?cb=1430794355" alt="PageRank â How it Works ?
Web graph as a Matrix
Links = nonzero elements in matrix
Every page âiâ has liâ¥1 outlinks. Sij =..."/>


Plurality:
Candidate with the most first-place votes (called the plurality candidate) wins
Don’t need each voter to rank the candidates - need only the voter’s first choice

Borda:
Candidate with highest total is winner

# Massey's Method

<img src="https://imagesvc.timeincapp.com/v3/fan/image?url=https%3A%2F%2Fbluemanhoop.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2017%2F07%2F1154518288.jpeg&amp;c=sc&amp;w=850&amp;h=560" alt="OAKLAND, CALIFORNIA - JUNE 07: Stephen Curry #30 of the Golden State Warriors reacts late in the game against the Toronto Raptors in the second half during Game Four of the 2019 NBA Finals at ORACLE Arena on June 07, 2019 in Oakland, California. NOTE TO USER: User expressly acknowledges and agrees that, by downloading and or using this photograph, User is consenting to the terms and conditions of the Getty Images License Agreement. (Photo by Ezra Shaw/Getty Images)"/>

Used to measure performance.

SEE WIKIPEDIA LINK for more info:

https://en.wikipedia.org/wiki/Kenneth_Massey

"The Massey Ratings are designed to measure past performance, not necessarily to predict future outcomes. The first challenge for any computer rating system is to account for the variability in performance. 

A team will not always play up to its full potential. Other random factors (officiating, bounce of the ball) may also affect the outcome of a game. 

1) The model must somehow eliminate the "noise" which obscures the true strength of a team. 
2) The second goal is to account for the differences in schedule. When there is a large disparity in schedule strength, win-loss records lose their significance. 
3) The model must evaluate games involving mismatched opponents, as well as contests between well matched teams. 

It is necessary to achieve a reasonable balance between rewarding teams for wins, convincing wins, and playing a tough schedule. This issue is difficult to resolve, and rating systems exist that are based on each of the extremes. 

The overall team rating is a merit based quantity, and is the result of applying a Bayesian win-loss correction to the power rating. Only the score, venue, and date of each game are used to calculate the Massey ratings. Stats such as rushing yards, rebounds, or field-goal percentage are not included. Nor are game conditions such as weather, crowd noise, day/night, or grass/artificial turf. Overtime games are not treated any differently. Finally, neither injuries nor psychological factors like motivation are considered."

# Singular Value Decomposition

Given a matrix A, we decompose into left, diagonal and right singular value matrix.
Then, we cut of k singular values, so that we can reduce dimensionality.
We don't want to cut off too many, otherwise we will get a poor representation of the data.

# Rank Approximation using Photo of Mandrill

Used low-rank approximation using SVD to reduce dimensionality for the sake of minimizing the cost of data storage.

<img src="https://www.researchgate.net/profile/Nicolas_Le_Bihan/publication/224744791/figure/fig2/AS:302848744149001@1449216175991/Singular-values-of-the-mandrill-color-image.png" alt="Singular values of the mandrill color imageÂ "/>

# Compress Image into R,G,B and Greyscale

Note: Any image can be used to compress image on R,G,B.
The file to be read is SVD.

<img src="https://ai2-s2-public.s3.amazonaws.com/figures/2017-08-08/552596061a26c59f15f11554ef17b6e7b3b2ed5a/2-Figure1-1.png" alt="Figure 1 Image unfolding and the preparation of an image matrix"/>











