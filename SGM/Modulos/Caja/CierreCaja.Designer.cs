﻿namespace SGM.Modulos.Caja
{
    partial class CierreCaja
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CierreCaja));
            this.txtfechacierre = new System.Windows.Forms.DateTimePicker();
            this.datalistado_caja = new System.Windows.Forms.DataGridView();
            this.dataGridViewImageColumn2 = new System.Windows.Forms.DataGridViewImageColumn();
            this.lblSerialPc = new System.Windows.Forms.Label();
            this.txtidcaja = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.datalistado_caja)).BeginInit();
            this.SuspendLayout();
            // 
            // txtfechacierre
            // 
            this.txtfechacierre.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.txtfechacierre.Location = new System.Drawing.Point(347, 51);
            this.txtfechacierre.Name = "txtfechacierre";
            this.txtfechacierre.Size = new System.Drawing.Size(200, 20);
            this.txtfechacierre.TabIndex = 629;
            // 
            // datalistado_caja
            // 
            this.datalistado_caja.AllowUserToAddRows = false;
            this.datalistado_caja.AllowUserToResizeRows = false;
            this.datalistado_caja.BackgroundColor = System.Drawing.Color.White;
            this.datalistado_caja.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.datalistado_caja.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.datalistado_caja.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.datalistado_caja.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.datalistado_caja.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewImageColumn2});
            this.datalistado_caja.EnableHeadersVisualStyles = false;
            this.datalistado_caja.Location = new System.Drawing.Point(347, 170);
            this.datalistado_caja.Name = "datalistado_caja";
            this.datalistado_caja.ReadOnly = true;
            this.datalistado_caja.RowHeadersVisible = false;
            this.datalistado_caja.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.datalistado_caja.RowTemplate.DefaultCellStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.datalistado_caja.RowTemplate.DefaultCellStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.datalistado_caja.RowTemplate.Height = 30;
            this.datalistado_caja.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.datalistado_caja.Size = new System.Drawing.Size(246, 38);
            this.datalistado_caja.TabIndex = 628;
            // 
            // dataGridViewImageColumn2
            // 
            this.dataGridViewImageColumn2.HeaderText = "";
            this.dataGridViewImageColumn2.Image = ((System.Drawing.Image)(resources.GetObject("dataGridViewImageColumn2.Image")));
            this.dataGridViewImageColumn2.ImageLayout = System.Windows.Forms.DataGridViewImageCellLayout.Zoom;
            this.dataGridViewImageColumn2.Name = "dataGridViewImageColumn2";
            this.dataGridViewImageColumn2.ReadOnly = true;
            // 
            // lblSerialPc
            // 
            this.lblSerialPc.AutoSize = true;
            this.lblSerialPc.Location = new System.Drawing.Point(525, 149);
            this.lblSerialPc.Name = "lblSerialPc";
            this.lblSerialPc.Size = new System.Drawing.Size(35, 13);
            this.lblSerialPc.TabIndex = 626;
            this.lblSerialPc.Text = "label3";
            // 
            // txtidcaja
            // 
            this.txtidcaja.AutoSize = true;
            this.txtidcaja.Location = new System.Drawing.Point(525, 120);
            this.txtidcaja.Name = "txtidcaja";
            this.txtidcaja.Size = new System.Drawing.Size(35, 13);
            this.txtidcaja.TabIndex = 627;
            this.txtidcaja.Text = "label3";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(618, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(170, 59);
            this.button1.TabIndex = 625;
            this.button1.Text = "CERRAR TURNO";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // CierreCaja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtfechacierre);
            this.Controls.Add(this.datalistado_caja);
            this.Controls.Add(this.lblSerialPc);
            this.Controls.Add(this.txtidcaja);
            this.Controls.Add(this.button1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "CierreCaja";
            this.Text = "CierreCaja";
            ((System.ComponentModel.ISupportInitialize)(this.datalistado_caja)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker txtfechacierre;
        private System.Windows.Forms.DataGridView datalistado_caja;
        private System.Windows.Forms.DataGridViewImageColumn dataGridViewImageColumn2;
        private System.Windows.Forms.Label lblSerialPc;
        private System.Windows.Forms.Label txtidcaja;
        private System.Windows.Forms.Button button1;
    }
}