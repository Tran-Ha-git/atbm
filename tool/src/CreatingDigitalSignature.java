import java.awt.Color;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.crypto.SecretKey;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.border.EmptyBorder;

public class CreatingDigitalSignature extends JFrame {
	private JPanel contentPane;
	private JLabel lblKey, lblalgorithm;
	private JLabel lblHashCode;
	private JTextArea textAreaHashCode,textAreaPrivateKey;
	private JTextArea textAreaSignature;
	private JLabel lblSignature;
	private JButton btnEncrypt;
	private SecretKey key;
	private static String keyString;
	private static byte[] ciphertext;
	private static KeyPair keypair;
	private static PublicKey publicKey;
	private static PrivateKey privateKey;

	public CreatingDigitalSignature() {
		ImageIcon imgicon = new ImageIcon("images/nlu_logo.gif");
		setIconImage(imgicon.getImage());
		setBounds(100, 100, 909, 249);
		this.contentPane = new JPanel();
		this.contentPane.setBackground(SystemColor.control);
		this.contentPane.setForeground(Color.WHITE);
		this.contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(this.contentPane);
		this.contentPane.setLayout(null);
		this.contentPane.setBackground(Color.pink);

		this.lblKey = new JLabel("Private Key : ");
		this.lblKey.setBounds(10, 11, 230, 14);
		this.contentPane.add(this.lblKey);

		this.textAreaPrivateKey = new JTextArea();
//		this.textAreaPrivateKey.setBounds(100, 8, 350, 50);
		JScrollPane scrollPane1 = new JScrollPane(textAreaPrivateKey, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane1.setBounds(100, 8, 350, 70);
//		this.contentPane.add(this.textAreaPrivateKey);
		this.contentPane.add(scrollPane1);
		
		

		this.lblHashCode = new JLabel("HashCode: ");
		this.lblHashCode.setBounds(10, 85, 76, 14);
		this.contentPane.add(this.lblHashCode);

		this.textAreaHashCode = new JTextArea();
		this.textAreaHashCode.setLineWrap(true);
		this.textAreaHashCode.setBounds(10, 100, 200, 121);
		this.contentPane.add(this.textAreaHashCode);

		this.textAreaSignature = new JTextArea();
		this.textAreaSignature.setLineWrap(true);
		this.textAreaSignature.setBounds(337, 100, 200, 121);
		this.contentPane.add(this.textAreaSignature);

		this.lblSignature = new JLabel("Signature: ");
		this.lblSignature.setBounds(337, 85, 150, 14);
		this.contentPane.add(this.lblSignature);
		
		

		this.btnEncrypt = new JButton("Encrypt >>");
		// btnEncrypt.setBackground(Color.yellow);
		this.btnEncrypt.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String msg = textAreaHashCode.getText();
					
					PrivateKey privKey = getPrivateKey(textAreaPrivateKey.getText().toString());
					// Creating a Signature object
					Signature sign = Signature.getInstance("SHA256withRSA");
					sign.initSign(privKey);
					byte[] bytes = msg.getBytes();

					// Adding data to the signature
					sign.update(bytes);

					// Calculating the signature
					byte[] signature = sign.sign();
					textAreaSignature.setText(Base64.getEncoder().encodeToString(signature));
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		this.btnEncrypt.setBounds(220, 130, 107, 23);
		this.contentPane.add(this.btnEncrypt);

	}

	public static PrivateKey getPrivateKey(String base64PrivateKey) {
		PrivateKey privateKey = null;
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(base64PrivateKey.getBytes()));
		KeyFactory keyFactory = null;

		try {
			keyFactory = keyFactory.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		try {
			privateKey = keyFactory.generatePrivate(keySpec);
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return privateKey;
	}

	public static void main(String[] args) {
		CreatingDigitalSignature jfAsym = new CreatingDigitalSignature();
		jfAsym.setTitle("Creating Digital Signature");
		jfAsym.setSize(600, 300);
		jfAsym.setLocationRelativeTo(null);
		jfAsym.setVisible(true);
	}
}
