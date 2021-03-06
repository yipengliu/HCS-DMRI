# HCS-DMRI: Periodic Time-Variant Subsampling and Omnidirectional Total Variation Based Reconstruction
Compressive sensing (CS) has been used to accelerate dynamic magnetic resonance imaging (DMRI). Currently the online CS-DMRI is faster, while the ofﬂine one gives higher accuracy for image reconstruction. To achieve good image reconstruction performance on both speed and accuracy, we propose a hybrid CS-DMRI method using periodic time-variant subsampling for different frames. In each period, there is one reference frame which is sampled at a higher subsampling ratio. The nearby two reference frames with good reconstruction quality can be used to give rough predictions of the other frames between them. To ﬁnely recover the current frame, one structural regularization in the optimization model for reconstruction is a 2-dimensional omnidirectional total variation (OTV) for exploiting the sparsity of the difference between the predicted and estimated frames, and the other is a 3dimensional OTV as a regularization term for exploiting the bilateral spatio-temporal coherence between forward reference frame, current frame and backward reference frame. Comparing with classical total variation, the proposed OTV makes the most of the correlations of all the possible directions of the data. The formulated optimization model can be solved by the iterative reweighted least squares with the pre-conditioned conjugate gradient method. Numerical experiments show that the proposed method has better reconstruction accuracy than all the existing methods and low computational complexity which is comparable to the existing online methods.

# data sources
The datasets used in this paper are all online available, you can obtain it through the link described as follows:

1.the cardiac perfusion dataset with the size 192×192×40 ( http://ranger.uta.edu/~huang/R_CSMRI.htm)

2.the cardiac cine dataset with the size 256×256×30 for regular MR imaging, which are online available at (http://www.doc.ic.ac.uk/~jc1006/software.html).

3.the cine dataset with the size 256×256×24 for parallel imaging ( http://cai2r.net/resources/software/k-t-sparse-sense-matlab-code).



# reference:
Yipeng Liu, Shan Wu, Xiaolin Huang, Bing Chen, Ce Zhu, "Hybrid CS-DMRI: Periodic Time-Variant Subsampling and Omnidirectional	Total Variation Based Reconstruction," IEEE Transactions on Medical Imaging, 2017. DOI: 10.1109/TMI.2017.2717502.
