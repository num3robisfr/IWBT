USE [IBWT]
GO

/****** Object:  Table [dbo].[Adresse]    Script Date: 06/07/2018 10:38:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE Facture (
	[facId] [varchar](50)  NOT NULL, /*= comId*/
	[facDate] [varchar](50) NOT NULL,
	[cliId] [varchar](50) NULL,
	[facDestinataire] [varchar](250) NOT NULL, /*= Prenom + Nom */
	[facAdrVoie] [varchar](150) NOT NULL,
	[facAdrComplement] [varchar](150) NOT NULL,
	[facAdrCpVille] [varchar](150) NOT NULL, /*= CP + Ville */
	[facTotalHTnb] [varchar](50) NULL,
	[facTotalTTCnb] [varchar](50) NULL,
 CONSTRAINT [pkFacture] PRIMARY KEY CLUSTERED 
(
	[facId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO



