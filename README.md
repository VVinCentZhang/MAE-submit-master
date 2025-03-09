# MAE-submit-master
## 使用VASP计算MAE时批量提交任务的脚本。
***
1. **需要先准备好INPUT.in文件，并使用**```vaspkit -task 621```**生成相应文件夹** (详细教程见[vaspkit](https://mp.weixin.qq.com/s/IWjShP26k90q-2GJ429vYA))
    - 创建MAE文件夹，准备好**INCAR**，KPOINTS，CHGCAR，POSCAR，POTCAR和**提交任务的脚本(本服务器为run.slurm，需根据自己的服务器修改)**，除**加粗**的两个文件外，其余文件建议使用软链接 \
      关于**INPUT.in**文件：
      ```shell
      1                    ! 1为预处理, 2为后处理 
      0 360 12             ! Phi, Spherical coordinate system 
      0 180 12             ! 0<= theta <=180, 90 degree means in x-y plane
      ```
      第二行为向量在$`xy`$平面与$`x`$轴方向的夹角$`\phi`$的取值范围及取点数 \
      第三行为向量与$`z`$轴的夹角$`\theta`$的取值范围及取点数 \
      vaspkit会在INCAR中写入$`\mathrm{SAXIS}= \ m_x\ m_y\ m_z`$ \
      其中
```math
\begin{cases}
m_x= \mathrm{sin}(\phi_i)\times \mathrm{cos}(\theta_j)\
m_y= \mathrm{sin}(\phi_i)\times \mathrm{sin}(\theta_j)\
m_z= \mathrm{cos}(\phi_i)
\end{cases}
```
2. **使用** ``` chmod + x run.sh ```**添加执行权限**
3. ``` ./ run.sh ```**运行脚本，会自动以文件夹名称提交任务**
4. **将INPUT.in第一行改为2，执行**```vaspkit -task 621```**提取计算结果**
