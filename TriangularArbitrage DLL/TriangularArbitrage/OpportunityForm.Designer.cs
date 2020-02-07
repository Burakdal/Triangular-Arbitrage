namespace TriangularArbitrage
{
    partial class OpportunityForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.paramTab = new System.Windows.Forms.TabControl();
            this.opportunityTab = new System.Windows.Forms.TabPage();
            this.opportunityGrid = new System.Windows.Forms.DataGridView();
            this.historyTab = new System.Windows.Forms.TabPage();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.paramTab.SuspendLayout();
            this.opportunityTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.opportunityGrid)).BeginInit();
            this.tabPage1.SuspendLayout();
            this.SuspendLayout();
            // 
            // paramTab
            // 
            this.paramTab.AccessibleDescription = "";
            this.paramTab.AccessibleName = "";
            this.paramTab.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.paramTab.Controls.Add(this.opportunityTab);
            this.paramTab.Controls.Add(this.historyTab);
            this.paramTab.Controls.Add(this.tabPage1);
            this.paramTab.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.paramTab.Location = new System.Drawing.Point(0, 5);
            this.paramTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.paramTab.Name = "paramTab";
            this.paramTab.SelectedIndex = 0;
            this.paramTab.Size = new System.Drawing.Size(1200, 688);
            this.paramTab.TabIndex = 0;
            this.paramTab.Tag = "";
            // 
            // opportunityTab
            // 
            this.opportunityTab.Controls.Add(this.opportunityGrid);
            this.opportunityTab.Location = new System.Drawing.Point(4, 29);
            this.opportunityTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.opportunityTab.Name = "opportunityTab";
            this.opportunityTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.opportunityTab.Size = new System.Drawing.Size(1192, 655);
            this.opportunityTab.TabIndex = 0;
            this.opportunityTab.Text = "Opportunities";
            this.opportunityTab.UseVisualStyleBackColor = true;
            // 
            // opportunityGrid
            // 
            this.opportunityGrid.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.opportunityGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.opportunityGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.opportunityGrid.Location = new System.Drawing.Point(0, 0);
            this.opportunityGrid.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.opportunityGrid.Name = "opportunityGrid";
            this.opportunityGrid.RowHeadersWidth = 62;
            this.opportunityGrid.Size = new System.Drawing.Size(1188, 648);
            this.opportunityGrid.TabIndex = 0;
            // 
            // historyTab
            // 
            this.historyTab.Location = new System.Drawing.Point(4, 29);
            this.historyTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.historyTab.Name = "historyTab";
            this.historyTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.historyTab.Size = new System.Drawing.Size(1192, 655);
            this.historyTab.TabIndex = 1;
            this.historyTab.Text = "History";
            this.historyTab.UseVisualStyleBackColor = true;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.checkBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 29);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1192, 655);
            this.tabPage1.TabIndex = 2;
            this.tabPage1.Text = "Parameters";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(39, 45);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(81, 24);
            this.checkBox1.TabIndex = 0;
            this.checkBox1.Text = "Param";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // OpportunityForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1200, 692);
            this.Controls.Add(this.paramTab);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "OpportunityForm";
            this.Text = "OpportunityForm";
            this.paramTab.ResumeLayout(false);
            this.opportunityTab.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.opportunityGrid)).EndInit();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl paramTab;
        private System.Windows.Forms.TabPage opportunityTab;
        private System.Windows.Forms.TabPage historyTab;
        private System.Windows.Forms.DataGridView opportunityGrid;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.CheckBox checkBox1;
    }
}